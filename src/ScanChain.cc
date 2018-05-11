// A cms3 looper to compare delta-beta and effective area pileup corrections

#include "../interface/ScanChain.h"

using namespace std;
using namespace tas;

bool CMS3Looper::CalorimeterVeto(const vector<unsigned int> &ecal, const vector<unsigned int> &hcal) {
  for (vector<unsigned int>::const_iterator ecal_it = ecal.begin(); ecal_it != ecal.end(); ecal_it++) {
    if (*ecal_it > 0) return true;
  }
  for (vector<unsigned int>::const_iterator hcal_it = hcal.begin(); hcal_it != hcal.end(); hcal_it++) {
    if (*hcal_it > 0) return true;
  }
  return false;
}

int CMS3Looper::ParentageIndex(int MotherPdgId, int MotherStatus) {
  if (MotherStatus == 4 || MotherStatus == 44) return 0; // ISR photon split
  if ( (MotherPdgId < 6 || MotherPdgId == 21 || MotherPdgId == 22 || MotherPdgId == 15 || MotherPdgId == 13 || MotherPdgId == 11) && MotherStatus > 20 ) return 1; // FSR photon split
  if ((MotherPdgId > 100 && MotherPdgId < 400) && MotherStatus == 2) return 2; // Light meson decay
  if ((MotherPdgId > 400 && MotherPdgId < 500) && MotherStatus == 2) return 3; // Charm meson decay
  if ((MotherPdgId > 500 && MotherPdgId < 600) && MotherStatus == 2) return 4; // Bottom meson decay
  if (MotherPdgId > 1000 && (MotherStatus == 2 || MotherStatus > 70) ) return 5; // Baryon decay
  if (MotherPdgId == 15 && MotherStatus == 2) return 6; // Tau Decay
  if (MotherPdgId == 23 || MotherPdgId == 24 || MotherPdgId == 25) return 7; // Boson Decay
  cout << "No Parent Index found " + to_string(MotherPdgId) + " " + to_string(MotherStatus) << endl;
  return 0; // Other
}

void CMS3Looper::ScanChain (TChain * tree, const char* outname, const int STC ) {
  TH1::SetDefaultSumw2(true);

  // Book histograms
  TH2F h_muEtaPhi("h_muEtaPhi","#eta,#phi of STCs Matched to Gen Muons",100,-2.4,2.4,100,-ROOT::Math::Pi(),ROOT::Math::Pi());

  // Histograms not fully split by gen match

  TH1F h_genDRST("h_genDRST","ST DR to Nearest Charged Status 1, p_{T} > 1 GeV",15,0,0.15);
  TH1F h_genDRSTC("h_genDRSTC","STC DR to Nearest Charged Status 1, p_{T} > 1 GeV",15,0,0.15);
  map<int, TH1F*> histsGenDRST;
  map<int, TH1F*> histsGenDRSTC;
  TH1F h_PFDRST("h_PFDRST","ST DR to Nearest PF Candidate",30,0,0.3);
  TH1F h_PFDRSTC("h_PFDRSTC","ST DR to Nearest PF Candidate",30,0,0.3);
  map<int, TH1F*> histsPFDRSTC;
  map<int, TH1F*> histsPFDRST;

  TH1F h_mother_eST("h_mother_eST","Mother of Electrons Matched to STs",9,0,9);
  h_mother_eST.GetXaxis()->SetBinLabel(1,"ISR Photon");
  h_mother_eST.GetXaxis()->SetBinLabel(2,"FSR Photon");
  h_mother_eST.GetXaxis()->SetBinLabel(3,"Light Meson Decay");
  h_mother_eST.GetXaxis()->SetBinLabel(4,"Charm Meson Decay");
  h_mother_eST.GetXaxis()->SetBinLabel(5,"Bottom Meson Decay");
  h_mother_eST.GetXaxis()->SetBinLabel(6,"Baryon Decay");
  h_mother_eST.GetXaxis()->SetBinLabel(7,"Tau Decay");
  h_mother_eST.GetXaxis()->SetBinLabel(8,"Heavy Boson Decay");
  h_mother_eST.GetXaxis()->SetBinLabel(9,"Other");
  TH1F h_mother_muST = *((TH1F*) h_mother_eST.Clone("h_mother_muST"));
  h_mother_muST.SetTitle("Mother of Muons Matched to STs");
  TH1F h_mother_eSTC = *((TH1F*) h_mother_eST.Clone("h_mother_eSTC"));
  h_mother_eSTC.SetTitle("Mother of Electrons Matched to STCs");
  TH1F h_mother_muSTC = *((TH1F*) h_mother_eST.Clone("h_mother_muSTC"));
  h_mother_muSTC.SetTitle("Mother of Muons Matched to STCs");
  map<string, TH1F*> histsMotherST;
  map<string, TH1F*> histsMotherSTC;

  // Selection 3 will indicate "Loose" Quality (2 pixel layers), 4 will indicate 3 pixel layers

  for (int i = 0; i <= 4; i++) { 
    histsGenDRST[i] = (TH1F*) h_genDRST.Clone(Form("h_genDR_ST%d",i));
    histsGenDRSTC[i] = (TH1F*) h_genDRSTC.Clone(Form("h_genDR_STC%d",i));
    histsPFDRST[i] = (TH1F*) h_PFDRST.Clone(Form("h_PFDR_ST%d",i));
    histsPFDRSTC[i] = (TH1F*) h_PFDRSTC.Clone(Form("h_PFDR_STC%d",i));

    histsMotherST["e"+to_string(i)] = (TH1F*) h_mother_eST.Clone(Form("h_mother_eST%d",i));
    histsMotherSTC["e"+to_string(i)] = (TH1F*) h_mother_eSTC.Clone(Form("h_mother_eSTC%d",i));
    histsMotherST["mu"+to_string(i)] = (TH1F*) h_mother_muST.Clone(Form("h_mother_muST%d",i));
    histsMotherSTC["mu"+to_string(i)] = (TH1F*) h_mother_muSTC.Clone(Form("h_mother_muSTC%d",i));
  }

  // Histograms fully split by gen match
  TH1F h_layers0("h_layers0","Tracker Layers with Measurement, Minimal Selections (p_{T}, good trajectory, short)",16,0,16);
  TH1F h_layers1("h_layers1","Tracker Layers with Measurement, Nearby Lep Veto",16,0,16);
  TH1F h_layers2("h_layers2","Tracker Layers with Measurement, Iso, Nearby PF Veto",16,0,16);
  TH1F h_layers3("h_layers3","Tracker Layers with Measurement, Quality, Iso, Nearby PF Veto",16,0,16);

  TH1F h_recoDR0_e("h_recoDR0_e","DR to Nearest Reco e, Minimal",15,0,0.15);
  TH1F h_recoDR1_e("h_recoDR1_e","DR to Nearest Reco e, Nearby Lep",15,0,0.15);
  TH1F h_recoDR2_e("h_recoDR2_e","DR to Nearest Reco e, Iso",15,0,0.15);
  TH1F h_recoDR3_e("h_recoDR3_e","DR to Nearest Reco e, Quality",15,0,0.15);
  TH1F h_recoDR0_mu("h_recoDR0_mu","DR to Nearest Reco #mu, Minimal",15,0,0.15);
  TH1F h_recoDR1_mu("h_recoDR1_mu","DR to Nearest Reco #mu, Nearby Lep",15,0,0.15);
  TH1F h_recoDR2_mu("h_recoDR2_mu","DR to Nearest Reco #mu, Iso",15,0,0.15);
  TH1F h_recoDR3_mu("h_recoDR3_mu","DR to Nearest Reco #mu, Quality",15,0,0.15);

  TH1F h_sig0("h_sig0","Inner 6 Layer Hit Signatures, Minimal",64,0,64);
  TH1F h_sig1("h_sig1","Inner 6 Layer Hit Signatures, Nearby PF Veto",64,0,64);
  TH1F h_sig2("h_sig2","Inner 6 Layer Hit Signatures, Iso, Nearby PF Veto",64,0,64);
  TH1F h_sig3("h_sig3","Inner 6 Layer Hit Signatures, Quality, Iso, Nearby PF Veto",64,0,64);
  const int sigInner6 = 0x3F;
  for (int i = 0; i < 64; i++) {
    ostringstream bits; 
    bits << bitset<6>(i) << endl;
    string bs = bits.str();
    reverse(bs.begin(),bs.end());
    h_sig0.GetXaxis()->SetBinLabel(i+1,bs.c_str());
    h_sig1.GetXaxis()->SetBinLabel(i+1,bs.c_str());
    h_sig2.GetXaxis()->SetBinLabel(i+1,bs.c_str());
    h_sig3.GetXaxis()->SetBinLabel(i+1,bs.c_str());
  }

  // int nIDs = 10;
  //  int genIDs[nIDs] = {0, 11, 13, 211, 321, 2212, 3312, 3112, 3222, 3334}; // None, el, mu, pi, K, p, Xi, Sigma+, Sigma-, Omega
  int nIDs = 7;
  int genIDs[nIDs] = {0, 11, 13, 211, 321, 2212, 3000}; // None, el, mu, pi, K, p, strange baryon
  map<int, vector<TH1F*> > histsLayerST;
  map<int, vector<TH1F*> > histsLayerSTC;
  map<int, vector<TH1F*> > histsSigST;
  map<int, vector<TH1F*> > histsSigSTC;
  map<int, vector<TH1F*> > histsRecoDRST_e;
  map<int, vector<TH1F*> > histsRecoDRSTC_e;
  map<int, vector<TH1F*> > histsRecoDRST_mu;
  map<int, vector<TH1F*> > histsRecoDRSTC_mu;
  for (int i_gid = 0; i_gid < nIDs; i_gid++) {
    int genID = genIDs[i_gid];
    histsRecoDRST_e[genID].push_back((TH1F*) h_recoDR0_e.Clone(Form("h_recoDR0STe_%d",genID)));
    histsRecoDRST_e[genID].push_back((TH1F*) h_recoDR1_e.Clone(Form("h_recoDR1STe_%d",genID)));
    histsRecoDRST_e[genID].push_back((TH1F*) h_recoDR2_e.Clone(Form("h_recoDR2STe_%d",genID)));
    histsRecoDRST_e[genID].push_back((TH1F*) h_recoDR3_e.Clone(Form("h_recoDR3STe_%d",genID)));
    histsRecoDRST_e[genID].push_back((TH1F*) h_recoDR3_e.Clone(Form("h_recoDR4STe_%d",genID)));

    histsRecoDRSTC_e[genID].push_back((TH1F*) h_recoDR0_e.Clone(Form("h_recoDR0STe_%d",genID)));
    histsRecoDRSTC_e[genID].push_back((TH1F*) h_recoDR1_e.Clone(Form("h_recoDR1STe_%d",genID)));
    histsRecoDRSTC_e[genID].push_back((TH1F*) h_recoDR2_e.Clone(Form("h_recoDR2STe_%d",genID)));
    histsRecoDRSTC_e[genID].push_back((TH1F*) h_recoDR3_e.Clone(Form("h_recoDR3STe_%d",genID)));
    histsRecoDRSTC_e[genID].push_back((TH1F*) h_recoDR3_e.Clone(Form("h_recoDR4STe_%d",genID)));

    histsRecoDRST_mu[genID].push_back((TH1F*) h_recoDR0_mu.Clone(Form("h_recoDR0STmu_%d",genID)));
    histsRecoDRST_mu[genID].push_back((TH1F*) h_recoDR1_mu.Clone(Form("h_recoDR1STmu_%d",genID)));
    histsRecoDRST_mu[genID].push_back((TH1F*) h_recoDR2_mu.Clone(Form("h_recoDR2STmu_%d",genID)));
    histsRecoDRST_mu[genID].push_back((TH1F*) h_recoDR3_mu.Clone(Form("h_recoDR3STmu_%d",genID)));
    histsRecoDRST_mu[genID].push_back((TH1F*) h_recoDR3_mu.Clone(Form("h_recoDR4STmu_%d",genID)));

    histsRecoDRSTC_mu[genID].push_back((TH1F*) h_recoDR0_mu.Clone(Form("h_recoDR0STmu_%d",genID)));
    histsRecoDRSTC_mu[genID].push_back((TH1F*) h_recoDR1_mu.Clone(Form("h_recoDR1STmu_%d",genID)));
    histsRecoDRSTC_mu[genID].push_back((TH1F*) h_recoDR2_mu.Clone(Form("h_recoDR2STmu_%d",genID)));
    histsRecoDRSTC_mu[genID].push_back((TH1F*) h_recoDR3_mu.Clone(Form("h_recoDR3STmu_%d",genID)));
    histsRecoDRSTC_mu[genID].push_back((TH1F*) h_recoDR3_mu.Clone(Form("h_recoDR4STmu_%d",genID)));

    histsLayerST[genID].push_back((TH1F*) h_layers0.Clone(Form("h_layers0ST_%d",genID)));
    histsLayerST[genID].push_back((TH1F*) h_layers1.Clone(Form("h_layers1ST_%d",genID)));
    histsLayerST[genID].push_back((TH1F*) h_layers2.Clone(Form("h_layers2ST_%d",genID)));
    histsLayerST[genID].push_back((TH1F*) h_layers3.Clone(Form("h_layers3ST_%d",genID)));
    histsLayerST[genID].push_back((TH1F*) h_layers3.Clone(Form("h_layers4ST_%d",genID)));

    histsLayerSTC[genID].push_back((TH1F*) h_layers0.Clone(Form("h_layers0STC_%d",genID)));
    histsLayerSTC[genID].push_back((TH1F*) h_layers1.Clone(Form("h_layers1STC_%d",genID)));
    histsLayerSTC[genID].push_back((TH1F*) h_layers2.Clone(Form("h_layers2STC_%d",genID)));
    histsLayerSTC[genID].push_back((TH1F*) h_layers3.Clone(Form("h_layers3STC_%d",genID)));
    histsLayerSTC[genID].push_back((TH1F*) h_layers3.Clone(Form("h_layers4STC_%d",genID)));

    histsSigST[genID].push_back((TH1F*) h_sig0.Clone(Form("h_sig0ST_%d",genID)));
    histsSigST[genID].push_back((TH1F*) h_sig1.Clone(Form("h_sig1ST_%d",genID)));
    histsSigST[genID].push_back((TH1F*) h_sig2.Clone(Form("h_sig2ST_%d",genID)));
    histsSigST[genID].push_back((TH1F*) h_sig3.Clone(Form("h_sig3ST_%d",genID)));
    histsSigST[genID].push_back((TH1F*) h_sig3.Clone(Form("h_sig4ST_%d",genID)));

    histsSigSTC[genID].push_back((TH1F*) h_sig0.Clone(Form("h_sig0STC_%d",genID)));
    histsSigSTC[genID].push_back((TH1F*) h_sig1.Clone(Form("h_sig1STC_%d",genID)));
    histsSigSTC[genID].push_back((TH1F*) h_sig2.Clone(Form("h_sig2STC_%d",genID)));
    histsSigSTC[genID].push_back((TH1F*) h_sig3.Clone(Form("h_sig3STC_%d",genID)));
    histsSigSTC[genID].push_back((TH1F*) h_sig3.Clone(Form("h_sig4STC_%d",genID)));
  }

  cout << "Initialized hists" << endl;

  cms3.Init(tree);
  const unsigned int nEvents = tree->GetEntries();
  const unsigned int event_max = nEvents;

  // Loop over events
  for (unsigned int event = 0; event < event_max; event++) {
    if ( (event+1) % 1000 == 0 ) cout << 100. * event / event_max << "%" << endl;
    tree->LoadTree(event);
    cms3.GetEntry(event);
    
    // Loop over isotracks
    for (unsigned int i_it = 0; i_it < cms3.isotracks_p4().size(); i_it++) {
      if (!cms3.isotracks_fromPV().at(i_it)) continue;
      if (!cms3.isotracks_isLostTrack().at(i_it)) continue;

      // Veto dead cells
      if (CalorimeterVeto(cms3.isotracks_crossedEcalStatus().at(i_it),cms3.isotracks_crossedHcalStatus().at(i_it))) continue;

      // Veto transition region, highly forward
      const float eta = fabs(cms3.isotracks_p4().at(i_it).eta());
      if ( (1.38 < eta && eta < 1.6) || eta > 2.4) continue;

      // Only high pt tracks
      const float pt = cms3.isotracks_p4().at(i_it).pt();
      if (pt < 15) continue;

      // Shortness requirement, and length categorization
      const bool lostOuterHitsSel = isotracks_numberOfLostHitsOuter().at(i_it) >= 2;
      const bool PixEqTracker = cms3.isotracks_pixelLayersWithMeasurement().at(i_it) == cms3.isotracks_trackerLayersWithMeasurement().at(i_it);
      const bool PixLtTracker = cms3.isotracks_pixelLayersWithMeasurement().at(i_it) < cms3.isotracks_trackerLayersWithMeasurement().at(i_it);
      const bool shortSel = cms3.isotracks_trackerLayersWithMeasurement().at(i_it) < 7;
      const bool isP = PixEqTracker && lostOuterHitsSel;
      const bool isS = PixLtTracker && shortSel && lostOuterHitsSel;
      const bool isL = PixLtTracker && !shortSel && lostOuterHitsSel;
      const bool isShort = isP || isS || isL; 

      // Who generated this track at gen level?
      int genPdgId = 0; int genIdx = -1; float minDR = 100;
      for (unsigned int i_gen = 0; i_gen < cms3.genps_p4().size(); i_gen++) {
	if (cms3.genps_status().at(i_gen) != 1) continue;
	if (cms3.genps_p4().at(i_gen).pt() < 1.0) continue;
	if (fabs(cms3.genps_charge().at(i_gen)) < 0.01) continue;
	float dr = DeltaR(cms3.genps_p4().at(i_gen),cms3.isotracks_p4().at(i_it));
	if (dr < minDR) {
	  genPdgId = abs(cms3.genps_id().at(i_gen));
	  genIdx = i_gen;
	  minDR = dr;
	}
      }
      const int genDR = minDR;
      if (genDR > 0.06) genPdgId = 0; // Only count matches at DR < 0.06 (the average DR)

      if (genPdgId > 3000) genPdgId = 3000; // Merge all strange baryons
      const int parentageIndex = genIdx >= 0 ? ParentageIndex(abs(cms3.genps_id_mother().at(genIdx)),cms3.genps_status().at(cms3.genps_idx_mother().at(genIdx))) : 0;

      if (unlikely(histsLayerST.count(genPdgId) == 0)) {cout << "Found a matching genID that was not on the list: " << genPdgId << endl; return;}
      vector<TH1F*>& hvLayerST = histsLayerST[genPdgId];
      vector<TH1F*>& hvLayerSTC = histsLayerSTC[genPdgId];
      vector<TH1F*>& hvSigST = histsSigST[genPdgId];
      vector<TH1F*>& hvSigSTC = histsSigSTC[genPdgId];
      vector<TH1F*>& hvRecoDReST = histsRecoDRST_e[genPdgId];
      vector<TH1F*>& hvRecoDReSTC = histsRecoDRSTC_e[genPdgId];
      vector<TH1F*>& hvRecoDRmuST = histsRecoDRST_mu[genPdgId];
      vector<TH1F*>& hvRecoDRmuSTC = histsRecoDRSTC_mu[genPdgId];

      const int Nlayers = cms3.isotracks_trackerLayersWithMeasurement().at(i_it);
      const int inner6 = cms3.isotracks_HitSignature().at(i_it) & sigInner6;

      const float nearestPF_DR = cms3.isotracks_nearestPF_DR().at(i_it);
      const int nearestPF_id = abs(cms3.isotracks_nearestPF_id().at(i_it));
      const bool nearestPFSel = ! (nearestPF_DR < 0.1 && (nearestPF_id == 11 || nearestPF_id == 13));

      // Find nearest reco leptons
      float minRecoDR_e = 100;
      for (unsigned int i_el = 0; i_el < cms3.els_p4().size(); i_el++) {
	if (cms3.els_p4().at(i_el).pt() < 10) continue;
	//if (!electronID(i_el,id_level_t::HAD_veto_noiso_v4) || !electronID(i_el,id_level_t::HAD_veto_v4)) continue;
	if (float dr = DeltaR(cms3.els_p4().at(i_el),cms3.isotracks_p4().at(i_it)) < minRecoDR_e) {minRecoDR_e = dr;}
      }
      float minRecoDR_mu = 100;
      for (unsigned int i_mu = 0; i_mu < cms3.mus_p4().size(); i_mu++) {
	if (cms3.mus_p4().at(i_mu).pt() < 10) continue;
	//	if (!muonID(i_mu,id_level_t::HAD_loose_noiso_v4) || muonID(i_mu,id_level_t::HAD_loose_v4)) continue;
	if (float dr = DeltaR(cms3.mus_p4().at(i_mu),cms3.isotracks_p4().at(i_it)) < minRecoDR_mu) {minRecoDR_mu = dr;}
      }

      const bool nearestRecoSel = !(minRecoDR_mu < 0.1); // Only veto Reco muons for now

      // Minimal (Tier 0 Fills)
      if (isShort) {
	hvLayerST.at(0)->Fill(Nlayers);
	hvSigST.at(0)->Fill(inner6);
	hvRecoDReST.at(0)->Fill(minRecoDR_e);
	hvRecoDRmuST.at(0)->Fill(minRecoDR_mu);
	histsGenDRST[0]->Fill(genDR);
	histsPFDRST[0]->Fill(nearestPF_DR);
	if (genPdgId == 11) histsMotherST["e0"]->Fill(parentageIndex);
	else if (genPdgId == 13) histsMotherST["mu0"]->Fill(parentageIndex);
      }
      hvLayerSTC.at(0)->Fill(Nlayers);
      hvSigSTC.at(0)->Fill(inner6);
      hvRecoDReSTC.at(0)->Fill(minRecoDR_e);
      hvRecoDRmuSTC.at(0)->Fill(minRecoDR_mu);
      histsGenDRSTC[0]->Fill(genDR);
      histsPFDRSTC[0]->Fill(nearestPF_DR);
      if (genPdgId == 11) histsMotherSTC["e0"]->Fill(parentageIndex);
      else if (genPdgId == 13) histsMotherSTC["mu0"]->Fill(parentageIndex);


      // Nearest PF and reco lep veto
      if (!nearestPFSel || !nearestRecoSel) continue;      
      if (isShort) {
	hvLayerST.at(1)->Fill(Nlayers);
	hvSigST.at(1)->Fill(inner6);
	hvRecoDReST.at(1)->Fill(minRecoDR_e);
	hvRecoDRmuST.at(1)->Fill(minRecoDR_mu);
	histsGenDRST[1]->Fill(genDR);
	histsPFDRST[1]->Fill(nearestPF_DR);
	if (genPdgId == 11) histsMotherST["e1"]->Fill(parentageIndex);
	else if (genPdgId == 13) histsMotherST["mu1"]->Fill(parentageIndex);
      }
      hvLayerSTC.at(1)->Fill(Nlayers);
      hvSigSTC.at(1)->Fill(inner6);
      hvRecoDReSTC.at(1)->Fill(minRecoDR_e);
      hvRecoDRmuSTC.at(1)->Fill(minRecoDR_mu);
      histsGenDRSTC[1]->Fill(genDR);
      histsPFDRSTC[1]->Fill(nearestPF_DR);
      if (genPdgId == 11) histsMotherSTC["e1"]->Fill(parentageIndex);
      else if (genPdgId == 13) histsMotherSTC["mu1"]->Fill(parentageIndex);

      const float pfNeutralSum = cms3.isotracks_pfNeutralSum().at(i_it);
      const bool NeuIso0p05Sel = pfNeutralSum < 10;
      const bool NeuIso0p05SelSTC = pfNeutralSum < 10*STC;
      const bool NeuRelIso0p05Sel = pfNeutralSum / pt < 0.1;
      const bool NeuRelIso0p05SelSTC = pfNeutralSum / pt < 0.1*STC;
      const bool notLepOverlapSel = !cms3.isotracks_lepOverlap().at(i_it);
      const float absiso_corr = cms3.isotracks_pfIso_ch().at(i_it) + max(0.0, cms3.isotracks_pfIso_nh().at(i_it) + cms3.isotracks_pfIso_em().at(i_it) - 0.5 * cms3.isotracks_pfIso_db().at(i_it));
      const float reliso = absiso_corr / pt;
      const bool isoSel = absiso_corr < 10;
      const bool isoSelSTC = absiso_corr < 10 * STC;
      const bool relisoSel = reliso < 0.2;
      const bool relisoSelSTC = reliso < 0.2 * STC;
      const bool FullIsoSel = NeuIso0p05Sel && NeuRelIso0p05Sel && isoSel && relisoSel && notLepOverlapSel;
      const bool FullIsoSelSTC = NeuIso0p05SelSTC && NeuRelIso0p05SelSTC && isoSelSTC && relisoSelSTC && notLepOverlapSel;

      if (!FullIsoSelSTC) continue;
      if (!FullIsoSel && isShort) {
	hvLayerST.at(2)->Fill(Nlayers);
	hvSigST.at(2)->Fill(inner6);
	hvRecoDReST.at(2)->Fill(minRecoDR_e);
	hvRecoDRmuST.at(2)->Fill(minRecoDR_mu);
	histsGenDRST[2]->Fill(genDR);
	histsPFDRST[2]->Fill(nearestPF_DR);
	if (genPdgId == 11) histsMotherST["e2"]->Fill(parentageIndex);
	else if (genPdgId == 13) histsMotherST["mu2"]->Fill(parentageIndex);
      }
      hvLayerSTC.at(2)->Fill(Nlayers);
      hvSigSTC.at(2)->Fill(inner6);
      hvRecoDReSTC.at(2)->Fill(minRecoDR_e);
      hvRecoDRmuSTC.at(2)->Fill(minRecoDR_mu);
      histsGenDRSTC[2]->Fill(genDR);
      histsPFDRSTC[2]->Fill(nearestPF_DR);
      if (genPdgId == 11) histsMotherSTC["e2"]->Fill(parentageIndex);
      else if (genPdgId == 13) histsMotherSTC["mu2"]->Fill(parentageIndex);

      // Quality
      const bool pixLayersSelTight = isotracks_pixelLayersWithMeasurement().at(i_it) >= 3;
      const bool pixLayersSelLoose = isotracks_pixelLayersWithMeasurement().at(i_it) >= 2;
      const bool pixLayersSel = isL ? pixLayersSelLoose : pixLayersSelTight; // Always apply 2 layer selection to long tracks
      const bool lostInnerHitsSel = isotracks_numberOfLostHitsInner().at(i_it) == 0;
      const float pterr = cms3.isotracks_pterr().at(i_it);
      const float pterrOverPt2 = pterr / (pt*pt);
      const bool pterrSelLoose = pterrOverPt2 <= 0.2;
      const bool pterrSelMedium = pterrOverPt2 <= 0.02;
      const bool pterrSelTight = pterrOverPt2 <= 0.005;
      const bool pterrSelLooseSTC = pterrOverPt2 <= 0.2 * STC;
      const bool pterrSelMediumSTC = pterrOverPt2 <= 0.02 * STC;
      const bool pterrSelTightSTC = pterrOverPt2 <= 0.005 * STC;
      // Assume long track, mostly since STC will usually be long      
      bool pterrSel = pterrSelTight;
      bool pterrSelSTC = pterrSelTightSTC;
      if (isP) {pterrSel = pterrSelLoose; pterrSelSTC = pterrSelLooseSTC;}
      else if (isS) {pterrSel = pterrSelMedium; pterrSelSTC = pterrSelMediumSTC;}
      const bool isHighPurity = cms3.isotracks_isHighPurityTrack().at(i_it);
      const float dxy = fabs(cms3.isotracks_dxy().at(i_it));
      const bool dxySelLoose = dxy < 0.02;
      const bool dxySelLooseSTC = dxy < 0.02 * STC;
      const bool dxySelTight = dxy < 0.01;
      const bool dxySelTightSTC = dxy < 0.01 * STC;
      const bool dxySel = isP ? dxySelLoose : dxySelTight;
      const bool dxySelSTC = isP ? dxySelLooseSTC : dxySelTightSTC;
      const float dz = fabs(cms3.isotracks_dz().at(i_it));
      const bool dzSel = dz < 0.05;
      const bool dzSelSTC = dz < 0.05*STC;
      const bool QualityTrack = pixLayersSel && lostInnerHitsSel && pterrSel && isHighPurity && dxySel && dzSel;
      const bool QualityTrackSTC =  pixLayersSel && lostInnerHitsSel && pterrSelSTC && isHighPurity && dxySelSTC && dzSelSTC;
      // Compare to 2 pixel layers requirement for S tracks (P should almost always have 3 anyway)
      const bool QualityTrackLoose = pixLayersSelLoose && lostInnerHitsSel && pterrSel && isHighPurity && dxySel && dzSel;
      const bool QualityTrackSTCLoose =  pixLayersSelLoose && lostInnerHitsSel && pterrSelSTC && isHighPurity && dxySelSTC && dzSelSTC;

      if (QualityTrackSTCLoose) {
	hvLayerSTC.at(3)->Fill(Nlayers);
	hvSigSTC.at(3)->Fill(inner6);
	if (genPdgId == 11) histsMotherSTC["e3"]->Fill(parentageIndex);
	else if (genPdgId == 13) {
	  histsMotherSTC["mu3"]->Fill(parentageIndex);
	  if (Nlayers > 9) h_muEtaPhi.Fill(cms3.isotracks_p4().at(i_it).eta(),cms3.isotracks_p4().at(i_it).phi());
	}
	if (QualityTrackSTC) {
	  hvLayerSTC.at(4)->Fill(Nlayers);
	  hvSigSTC.at(4)->Fill(inner6);
	  if (genPdgId == 11) histsMotherSTC["e4"]->Fill(parentageIndex);
	  else if (genPdgId == 13)histsMotherSTC["mu4"]->Fill(parentageIndex);
	}
      } // Passes >= 2 Pix Layer selection, STC
      if (isShort && QualityTrackLoose && FullIsoSel) {
	hvLayerST.at(3)->Fill(Nlayers);
	hvSigST.at(3)->Fill(inner6);
	if (genPdgId == 11) histsMotherST["e3"]->Fill(parentageIndex);
	else if (genPdgId == 13) histsMotherST["mu3"]->Fill(parentageIndex);
	if (QualityTrack) {
	  hvLayerST.at(4)->Fill(Nlayers);
	  hvSigST.at(4)->Fill(inner6);
	  if (genPdgId == 11) histsMotherST["e4"]->Fill(parentageIndex);
	  else if (genPdgId == 13) histsMotherST["mu4"]->Fill(parentageIndex);
	}
      } // Passes >= 2 Pix Layer selection, ST

    } // isotrack loop
  } // Event Loop

  cout << "Finished event loop." << endl;

  // Post-processing

  cout << "About to save histograms." << endl;

  TFile * OutFile_ = new TFile(Form("%s.root", outname), "RECREATE");
  OutFile_->cd();
  for (map<int, vector<TH1F*> >::const_iterator pair = histsLayerST.begin(); pair != histsLayerST.end(); pair++) {
    const vector<TH1F*>& toWrite = pair->second;
    for (vector<TH1F*>::const_iterator hist = toWrite.begin(); hist != toWrite.end(); hist++) {
      (*hist)->Write();
    }
  }
  for (map<int, vector<TH1F*> >::const_iterator pair = histsLayerSTC.begin(); pair != histsLayerSTC.end(); pair++) {
    const vector<TH1F*>& toWrite = pair->second;
    for (vector<TH1F*>::const_iterator hist = toWrite.begin(); hist != toWrite.end(); hist++) {
      (*hist)->Write();
    }
  }
  for (map<int, vector<TH1F*> >::const_iterator pair = histsSigST.begin(); pair != histsSigST.end(); pair++) {
    const vector<TH1F*>& toWrite = pair->second;
    for (vector<TH1F*>::const_iterator hist = toWrite.begin(); hist != toWrite.end(); hist++) {
      (*hist)->Write();
    }
  }
  for (map<int, vector<TH1F*> >::const_iterator pair = histsSigSTC.begin(); pair != histsSigSTC.end(); pair++) {
    const vector<TH1F*>& toWrite = pair->second;
    for (vector<TH1F*>::const_iterator hist = toWrite.begin(); hist != toWrite.end(); hist++) {
      (*hist)->Write();
    }
  }
  for (map<int, vector<TH1F*> >::const_iterator pair = histsRecoDRST_e.begin(); pair != histsRecoDRST_e.end(); pair++) {
    const vector<TH1F*>& toWrite = pair->second;
    for (vector<TH1F*>::const_iterator hist = toWrite.begin(); hist != toWrite.end(); hist++) {
      (*hist)->Write();
    }
  }
  for (map<int, vector<TH1F*> >::const_iterator pair = histsRecoDRSTC_e.begin(); pair != histsRecoDRSTC_e.end(); pair++) {
    const vector<TH1F*>& toWrite = pair->second;
    for (vector<TH1F*>::const_iterator hist = toWrite.begin(); hist != toWrite.end(); hist++) {
      (*hist)->Write();
    }
  }
  for (map<int, vector<TH1F*> >::const_iterator pair = histsRecoDRST_mu.begin(); pair != histsRecoDRST_mu.end(); pair++) {
    const vector<TH1F*>& toWrite = pair->second;
    for (vector<TH1F*>::const_iterator hist = toWrite.begin(); hist != toWrite.end(); hist++) {
      (*hist)->Write();
    }
  }
  for (map<int, vector<TH1F*> >::const_iterator pair = histsRecoDRSTC_mu.begin(); pair != histsRecoDRSTC_mu.end(); pair++) {
    const vector<TH1F*>& toWrite = pair->second;
    for (vector<TH1F*>::const_iterator hist = toWrite.begin(); hist != toWrite.end(); hist++) {
      (*hist)->Write();
    }
  }
  for (map<int, TH1F*>::const_iterator pair = histsGenDRST.begin(); pair != histsGenDRST.end(); pair++) {(pair->second)->Write();}
  for (map<int, TH1F*>::const_iterator pair = histsGenDRSTC.begin(); pair != histsGenDRSTC.end(); pair++) {(pair->second)->Write();}
  for (map<int, TH1F*>::const_iterator pair = histsPFDRST.begin(); pair != histsPFDRST.end(); pair++) {(pair->second)->Write();}
  for (map<int, TH1F*>::const_iterator pair = histsPFDRSTC.begin(); pair != histsPFDRSTC.end(); pair++) {(pair->second)->Write();}
  for (map<string, TH1F*>::const_iterator pair = histsMotherST.begin(); pair != histsMotherST.end(); pair++) {(pair->second)->Write();}
  for (map<string, TH1F*>::const_iterator pair = histsMotherSTC.begin(); pair != histsMotherSTC.end(); pair++) {(pair->second)->Write();}
  for (map<int, TH1F*>::const_iterator pair = histsGenDRST.begin(); pair != histsGenDRST.end(); pair++) {(pair->second)->Write();}
  for (map<int, TH1F*>::const_iterator pair = histsGenDRSTC.begin(); pair != histsGenDRSTC.end(); pair++) {(pair->second)->Write();}
  for (map<int, TH1F*>::const_iterator pair = histsPFDRST.begin(); pair != histsPFDRST.end(); pair++) {(pair->second)->Write();}
  for (map<int, TH1F*>::const_iterator pair = histsPFDRSTC.begin(); pair != histsPFDRSTC.end(); pair++) {(pair->second)->Write();}

  h_muEtaPhi.Write();
  OutFile_->Close();
}

int main (int argc, char ** argv) {
  if (argc < 3) {
    cout << "USAGE: ./ScanChain.exe <tag> <filename>" << endl;
    return 1;
  }

  char * outfileid = argv[1]; 
  char * filename = argv[2]; 

  TChain *chain = new TChain("Events");
  chain->Add(filename);
  cout << "Added " << filename << " to TChain" << endl;


  CMS3Looper cms3l;
  if (argc > 3) cms3l.ScanChain(chain,outfileid,atoi(argv[3]));
  else cms3l.ScanChain(chain,outfileid);
  return 0;
}

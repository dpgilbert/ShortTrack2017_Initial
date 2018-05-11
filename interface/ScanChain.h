#ifndef ScanChain_h
#define ScanChain_h

#include "TROOT.h"
#include "TFile.h"
#include "TChain.h"
#include "TTree.h"
#include "TTreeCache.h"
#include "TH1F.h"
#include "TH2F.h"
#include "TProfile.h"
#include "Math/LorentzVector.h"
#include "../../CORE/IsoTrackVeto.h"
#include "../../CORE/IsolationTools.h"
#include "../../CORE/CMS3.h"
#include "../../CORE/Tools/utils.h"
#include "../../CORE/ElectronSelections.h"
#include "../../CORE/MuonSelections.h"
#include "../../CORE/MCSelections.h"
#include <algorithm>
#include <vector>
#include <iostream>
#include <assert.h>
#include <map>
#include <string>
#include <sstream>
#include <bitset>

#define likely(x)       __builtin_expect((x),1)
#define unlikely(x)     __builtin_expect((x),0)

class CMS4Looper {
 public:
  CMS4Looper() {};
  ~CMS4Looper() {};
  
  void ScanChain(TChain *, const char* outname = "TestSample", const int STC=3);

  enum {P = 1, S, L};

 private:
  bool CalorimeterVeto(const vector<unsigned int>& ecal, const vector<unsigned int>& hcal);
  int ParentageIndex(int MotherPdgId, int MotherStatus);
};

#endif

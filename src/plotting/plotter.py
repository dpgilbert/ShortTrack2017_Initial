# STCandLooper plots

import ROOT
from math import sqrt
import re
import sys
import os
import subprocess
import ppmUtils as utils
import NiftyHists as nh

# Suppresses warnings about TH1::Sumw2
ROOT.gErrorIgnoreLevel = ROOT.kError

ROOT.gROOT.SetBatch(True)
ROOT.gStyle.SetOptStat(False)
ROOT.gStyle.SetLegendTextSize(0.1)
canvas = ROOT.TCanvas()
canvas.SetCanvasSize(600,400)
pads = []
pads.append(ROOT.TPad("1","1",0,0,0.67,1))
pads.append(ROOT.TPad("2","2",0.67,0,1,1))
pads[0].SetTicks(1,2)
pads[0].SetLeftMargin(0.14)
pads[0].SetTopMargin(0.12)
pads[0].SetRightMargin(0.12)
pads[0].Draw()
pads[1].Draw()
pads[0].cd()

ROOT.gStyle.SetLegendBorderSize(0)
tl = ROOT.TLegend(0.0,0.2,1,0.8)
tl.SetMargin(0.1)

verbose = False # Print more status messages
#doScan = False # Not implemented

if len(sys.argv) > 1: indir = sys.argv[1]
else: indir = "../output"
if len(sys.argv) > 2: outdir = sys.argv[2]
else : outdir = "pngs"
if (not os.path.exists(outdir)): os.mkdir(outdir)

selection_colors=[ROOT.kGreen,ROOT.kBlue,ROOT.kRed,ROOT.kBlack]

samples=["QCDHT300to500","QCDHT1000to1500","DYHT200to400","DYHT800to1200","TTSL"]
colors_sample=[ROOT.kGreen+4,ROOT.kGreen,ROOT.kBlue,ROOT.kCyan,ROOT.kMagenta]
sample_colors = dict(zip(samples,colors_sample))

for sample in samples:
    sample_outdir = outdir+"/"+sample
    if (not os.path.exists(sample_outdir)): os.mkdir(sample_outdir)
    for od in ["/Layer","/Sig","/RecoDRe","/RecoDRmu","MotherIDe","MotherIDmu","genDR","PFDR"]:
        thisOutdir = sample_outdir + od
        if (not os.path.exists(thisOutdir)): os.mkdir(thisOutdir)

lengths = ["ST","STC"]
layer_indices=["0","1","2","3","4"]
layers = [layer+length for length in lengths for layer in layer_indices]
layertags = ["Minimal","Nearby Lepton Veto","Isolation, Nearby PF Veto","Full (2+)","Full (3+)"]
layertag = dict(zip(layers,layertags + layertags))
#genIDsuffixes = ["3334","3312","3112","3222","11","13","211","321","2212","0"]
genIDsuffixes = ["3000","11","13","211","321","2212","0"]
#genTags = ["#Omega (sss)","#Xi (dss)","#Sigma^{+} (uus)","#Sigma^{-} (dds)","e","#mu","#pi","K","p","None"]
genTags = ["Strange Baryon","e","#mu","#pi","K","p","None"]
genTag = dict(zip(genIDsuffixes,genTags))
colors_gen=[ROOT.kGreen+4,ROOT.kGreen-8,ROOT.kGreen,ROOT.kGreen+2,ROOT.kBlue,ROOT.kCyan,ROOT.kMagenta,ROOT.kRed,ROOT.kYellow,ROOT.kBlack]
gen_colors=dict(zip(genIDsuffixes,colors_gen))

histdictLayer = {}
for sample in samples:
    f = ROOT.TFile.Open("{0}/{1}.root".format(indir,sample))
    dictToAdd = {}
    for layer in layers:
        layerDict = {}
        for gs in genIDsuffixes:
            hn = "h_layers{0}_{1}".format(layer,gs)
            layerDict[gs] = utils.GetUnderOverHist(f,hn,color=gen_colors[gs])
            layerDict[gs].SetDirectory(0)
            layerDict[gs].SetFillColor(gen_colors[gs])
        dictToAdd[layer] = layerDict
    histdictLayer[sample]=dictToAdd
    f.Close()

histdictSig = {}
for sample in samples:
    f = ROOT.TFile.Open("{0}/{1}.root".format(indir,sample))
    dictToAdd = {}
    for layer in layers:
        layerDict = {}
        for gs in genIDsuffixes:
            hn = "h_sig{0}_{1}".format(layer,gs)
            layerDict[gs] = utils.GetUnderOverHist(f,hn,color=gen_colors[gs])
            layerDict[gs].SetDirectory(0)
            layerDict[gs].SetFillColor(gen_colors[gs])
        dictToAdd[layer] = layerDict
    histdictSig[sample]=dictToAdd
    f.Close()

histdictReco_e = {}
for sample in samples:
    f = ROOT.TFile.Open("{0}/{1}.root".format(indir,sample))
    dictToAdd = {}
    for layer in layers:
        layerDict = {}
        for gs in genIDsuffixes:
            hn = "h_RecoDR{0}e_{1}".format(layer,gs)
            layerDict[gs] = utils.GetUnderOverHist(f,hn,color=gen_colors[gs])
            layerDict[gs].SetDirectory(0)
            layerDict[gs].SetFillColor(gen_colors[gs])
        dictToAdd[layer] = layerDict
    histdictReco_e[sample]=dictToAdd
    f.Close()

histdictReco_mu = {}
for sample in samples:
    f = ROOT.TFile.Open("{0}/{1}.root".format(indir,sample))
    dictToAdd = {}
    for layer in layers:
        layerDict = {}
        for gs in genIDsuffixes:
            hn = "h_RecoDR{0}mu_{1}".format(layer,gs)
            layerDict[gs] = utils.GetUnderOverHist(f,hn,color=gen_colors[gs])
            layerDict[gs].SetDirectory(0)
            layerDict[gs].SetFillColor(gen_colors[gs])
        dictToAdd[layer] = layerDict
    histdictReco_e[sample]=dictToAdd
    f.Close()

# Layer distributions
for sample in samples:
    stackhistsST = []
    stackhistsSTC = []
    sample_outdir = outdir+"/"+sample+"/Layer"
    for i,layer in enumerate(layers):
        isST = i < len(layers)/2
        name = sample+" "+layertag[layer]
        ths = ROOT.THStack(name,"{0} Layer Dist: {1}".format(sample_outdir,layertag[layer]))      
        ths.SetMinimum(1)
        histlist = []
        for gs in genIDsuffixes:
            hist = histdictLayer[sample][layer][gs]
            histlist.append(hist.Clone(hist.GetName()+"histlistcopy"))
            ths.Add(hist)
            tl.AddEntry(hist,genTag[gs])
        pads[0].cd()
        pads[0].SetLogy(True)
        ths.Draw("hist")
        pads[1].cd()
        tl.Draw()
        canvas.SaveAs("{0}/stacked_{1}_{2}.png".format(sample_outdir,sample,layer))
        pads[0].SetLogy(False)
        tl.Clear()
        sumName = sample+"ST"
        if not isST: sumName += "C"
        h = histlist[0].Clone("{0}_{1}".format(sumName,layer))
        h.SetTitle("{0} Layer Dists by Selection;Number of Layers;Count".format(sumName))
        for hadd in histlist[1:]:
            h.Add(hadd)
        if isST: stackhistsST.append(h)
        else: stackhistsSTC.append(h) 
        nh.OverlayUnitArea(histlist,genTags,"{0}/gendists_{1}_{2}.png".format(sample_outdir,sample,layer),True)
    for i,h in enumerate(stackhistsST):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    for i,h in enumerate(stackhistsSTC):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    nh.Overlay(stackhistsST,layertags,"{0}/selectionsST_{1}.png".format(sample_outdir,sample),True,1)
    nh.Overlay(stackhistsSTC,layertags,"{0}/selectionsSTC_{1}.png".format(sample_outdir,sample),True,1)

# signatures
for sample in samples:
    stackhistsST = []
    stackhistsSTC = []
    sample_outdir = outdir+"/"+sample+"/Sig"
    for i,layer in enumerate(layers):
        isST = i < len(layers)/2
        name = sample+" "+layertag[layer]
        ths = ROOT.THStack(name,"{0} Signature Dist: {1}".format(sample_outdir,layertag[layer]))      
        ths.SetMinimum(1)
        histlist = []
        for gs in genIDsuffixes:
            hist = histdictSig[sample][layer][gs]
            histlist.append(hist.Clone(hist.GetName()+"histlistcopy"))
            ths.Add(hist)
            tl.AddEntry(hist,genTag[gs])
        pads[0].cd()
        pads[0].SetLogy(True)
        ths.Draw("hist")
        pads[1].cd()
        tl.Draw()
        canvas.SaveAs("{0}/stacked_{1}_{2}.png".format(sample_outdir,sample,layer))
        pads[0].SetLogy(False)
        tl.Clear()
        sumName = sample+"ST"
        if not isST: sumName += "C"
        h = histlist[0].Clone("{0}_{1}".format(sumName,layer))
        h.SetTitle("{0} Signature Dists by Selection;Signature;Count".format(sumName))
        for hadd in histlist[1:]:
            h.Add(hadd)
        if isST: stackhistsST.append(h)
        else: stackhistsSTC.append(h) 
        nh.OverlayUnitArea(histlist,genTags,"{0}/gendists_{1}_{2}.png".format(sample_outdir,sample,layer),True)
    for i,h in enumerate(stackhistsST):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    for i,h in enumerate(stackhistsSTC):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    nh.Overlay(stackhistsST,layertags,"{0}/selectionsST_{1}.png".format(sample_outdir,sample),True,1)
    nh.Overlay(stackhistsSTC,layertags,"{0}/selectionsSTC_{1}.png".format(sample_outdir,sample),True,1)

# RecoDR_e
for sample in samples:
    stackhistsST = []
    stackhistsSTC = []
    sample_outdir = outdir+"/"+sample+"/RecoDRe"
    for i,layer in enumerate(layers):
        isST = i < len(layers)/2
        name = sample+" "+layertag[layer]
        ths = ROOT.THStack(name,"{0} Reco e #Delta R Dist: {1}".format(sample_outdir,layertag[layer]))      
        ths.SetMinimum(1)
        histlist = []
        for gs in genIDsuffixes:
            hist = histdictRecoDRe[sample][layer][gs]
            histlist.append(hist.Clone(hist.GetName()+"histlistcopy"))
            ths.Add(hist)
            tl.AddEntry(hist,genTag[gs])
        pads[0].cd()
        pads[0].SetLogy(True)
        ths.Draw("hist")
        pads[1].cd()
        tl.Draw()
        canvas.SaveAs("{0}/stacked_{1}_{2}.png".format(sample_outdir,sample,layer))
        pads[0].SetLogy(False)
        tl.Clear()
        sumName = sample+"ST"
        if not isST: sumName += "C"
        h = histlist[0].Clone("{0}_{1}".format(sumName,layer))
        h.SetTitle("{0} Reco e #Delta R Dists by Selection;#Delta R (e,track);Count".format(sumName))
        for hadd in histlist[1:]:
            h.Add(hadd)
        if isST: stackhistsST.append(h)
        else: stackhistsSTC.append(h) 
        nh.OverlayUnitArea(histlist,genTags,"{0}/gendists_{1}_{2}.png".format(sample_outdir,sample,layer),True)
    for i,h in enumerate(stackhistsST):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    for i,h in enumerate(stackhistsSTC):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    nh.Overlay(stackhistsST,layertags,"{0}/selectionsST_{1}.png".format(sample_outdir,sample),True,1)
    nh.Overlay(stackhistsSTC,layertags,"{0}/selectionsSTC_{1}.png".format(sample_outdir,sample),True,1)

# RecoDR_mu
for sample in samples:
    stackhistsST = []
    stackhistsSTC = []
    sample_outdir = outdir+"/"+sample+"/RecoDRmu"
    for i,layer in enumerate(layers):
        isST = i < len(layers)/2
        name = sample+" "+layertag[layer]
        ths = ROOT.THStack(name,"{0} Reco #mu #Delta R Dist: {1}".format(sample_outdir,layertag[layer]))      
        ths.SetMinimum(1)
        histlist = []
        for gs in genIDsuffixes:
            hist = histdictRecoDRe[sample][layer][gs]
            histlist.append(hist.Clone(hist.GetName()+"histlistcopy"))
            ths.Add(hist)
            tl.AddEntry(hist,genTag[gs])
        pads[0].cd()
        pads[0].SetLogy(True)
        ths.Draw("hist")
        pads[1].cd()
        tl.Draw()
        canvas.SaveAs("{0}/stacked_{1}_{2}.png".format(sample_outdir,sample,layer))
        pads[0].SetLogy(False)
        tl.Clear()
        sumName = sample+"ST"
        if not isST: sumName += "C"
        h = histlist[0].Clone("{0}_{1}".format(sumName,layer))
        h.SetTitle("{0} Reco e #Delta R Dists by Selection;#Delta R (#mu,track);Count".format(sumName))
        for hadd in histlist[1:]:
            h.Add(hadd)
        if isST: stackhistsST.append(h)
        else: stackhistsSTC.append(h) 
        nh.OverlayUnitArea(histlist,genTags,"{0}/gendists_{1}_{2}.png".format(sample_outdir,sample,layer),True)
    for i,h in enumerate(stackhistsST):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    for i,h in enumerate(stackhistsSTC):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    nh.Overlay(stackhistsST,layertags,"{0}/selectionsST_{1}.png".format(sample_outdir,sample),True,1)
    nh.Overlay(stackhistsSTC,layertags,"{0}/selectionsSTC_{1}.png".format(sample_outdir,sample),True,1)

layers = [length+layer for length in lengths for layer in layer_indices]
layertag = dict(zip(layers,layertags + layertags))

histdictMotherIDe = {}
for sample in samples:
    f = ROOT.TFile.Open("{0}/{1}.root".format(indir,sample))
    dictToAdd = {}
    for layer in layers:
        hn = "h_mother_e{0}".format(layer)
        dictToAdd[layer] = utils.GetUnderOverHist(f,hn,color=gen_colors[gs])
        dictToAdd[layer].SetDirectory(0)
        dictToAdd[layer].SetFillColor(gen_colors[gs])
        dictToAdd[layer] = layerDict
    histdictMotherIDe[sample]=dictToAdd
    f.Close()

histdictMotherIDmu = {}
for sample in samples:
    f = ROOT.TFile.Open("{0}/{1}.root".format(indir,sample))
    dictToAdd = {}
    for layer in layers:
        hn = "h_mother_mu{0}".format(layer)
        dictToAdd[layer] = utils.GetUnderOverHist(f,hn,color=gen_colors[gs])
        dictToAdd[layer].SetDirectory(0)
        dictToAdd[layer].SetFillColor(gen_colors[gs])
        dictToAdd[layer] = layerDict
    histdictMotherIDmu[sample]=dictToAdd
    f.Close()

histdictGenDR = {}
for sample in samples:
    f = ROOT.TFile.Open("{0}/{1}.root".format(indir,sample))
    dictToAdd = {}
    for layer in layers:
        hn = "h_genDR_{0}".format(layer)
        dictToAdd[layer] = utils.GetUnderOverHist(f,hn,color=gen_colors[gs])
        dictToAdd[layer].SetDirectory(0)
        dictToAdd[layer].SetFillColor(gen_colors[gs])
        dictToAdd[layer] = layerDict
    histdictMotherIDmu[sample]=dictToAdd
    f.Close()

histdictPFDR = {}
for sample in samples:
    f = ROOT.TFile.Open("{0}/{1}.root".format(indir,sample))
    dictToAdd = {}
    for layer in layers:
        hn = "h_PFDR_{0}".format(layer)
        dictToAdd[layer] = utils.GetUnderOverHist(f,hn,color=gen_colors[gs])
        dictToAdd[layer].SetDirectory(0)
        dictToAdd[layer].SetFillColor(gen_colors[gs])
        dictToAdd[layer] = layerDict
    histdictMotherIDmu[sample]=dictToAdd
    f.Close()

# MotherIDe
for sample in samples:
    stackhistsST = []
    stackhistsSTC = []
    sample_outdir = outdir+"/"+sample+"/MotherIDe"
    for i,layer in enumerate(layers):
        isST = i < len(layers)/2
        name = sample+" "+layertag[layer]
        hist = histdictMotherIDe[sample][layer]
        if isST: stackhistsST.append(hist)
        else: stackhistsSTC.append(hist) 
    for i,h in enumerate(stackhistsST):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    for i,h in enumerate(stackhistsSTC):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    nh.Overlay(stackhistsST,layertags,"{0}/selectionsST_{1}.png".format(sample_outdir,sample),True,1)
    nh.Overlay(stackhistsSTC,layertags,"{0}/selectionsSTC_{1}.png".format(sample_outdir,sample),True,1)

# MotherIDmu
for sample in samples:
    stackhistsST = []
    stackhistsSTC = []
    sample_outdir = outdir+"/"+sample+"/MotherIDmu"
    for i,layer in enumerate(layers):
        isST = i < len(layers)/2
        name = sample+" "+layertag[layer]
        hist = histdictMotherIDmu[sample][layer]
        if isST: stackhistsST.append(hist)
        else: stackhistsSTC.append(hist) 
    for i,h in enumerate(stackhistsST):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    for i,h in enumerate(stackhistsSTC):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    nh.Overlay(stackhistsST,layertags,"{0}/selectionsST_{1}.png".format(sample_outdir,sample),True,1)
    nh.Overlay(stackhistsSTC,layertags,"{0}/selectionsSTC_{1}.png".format(sample_outdir,sample),True,1)

# GenDR
for sample in samples:
    stackhistsST = []
    stackhistsSTC = []
    sample_outdir = outdir+"/"+sample+"/GenDR"
    for i,layer in enumerate(layers):
        isST = i < len(layers)/2
        name = sample+" "+layertag[layer]
        hist = histdictGenDR[sample][layer]
        if isST: stackhistsST.append(hist)
        else: stackhistsSTC.append(hist) 
    for i,h in enumerate(stackhistsST):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    for i,h in enumerate(stackhistsSTC):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    nh.Overlay(stackhistsST,layertags,"{0}/selectionsST_{1}.png".format(sample_outdir,sample),True,1)
    nh.Overlay(stackhistsSTC,layertags,"{0}/selectionsSTC_{1}.png".format(sample_outdir,sample),True,1)

# PFDR
for sample in samples:
    stackhistsST = []
    stackhistsSTC = []
    sample_outdir = outdir+"/"+sample+"/PFDR"
    for i,layer in enumerate(layers):
        isST = i < len(layers)/2
        name = sample+" "+layertag[layer]
        hist = histdictPFDR[sample][layer]
        if isST: stackhistsST.append(hist)
        else: stackhistsSTC.append(hist) 
    for i,h in enumerate(stackhistsST):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    for i,h in enumerate(stackhistsSTC):
        h.SetLineColor(selection_colors[i])
        h.SetFillColor(selection_colors[i])
    nh.Overlay(stackhistsST,layertags,"{0}/selectionsST_{1}.png".format(sample_outdir,sample),True,1)
    nh.Overlay(stackhistsSTC,layertags,"{0}/selectionsSTC_{1}.png".format(sample_outdir,sample),True,1)

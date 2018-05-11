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

lengths = ["ST","STC"]
layer_indices=["0","1","2","3"]
layers = [layer+length for length in lengths for layer in layer_indices]
layertags = ["Minimal","Nearby PF Veto","Isolation, Nearby PF Veto","Iso, PF Veto, Quality"]
layertag = dict(zip(layers,layertags + layertags))
genIDsuffixes = ["3334","3312","3112","3222","11","13","211","321","2212","0"]
genTags = ["#Omega (sss)","#Xi (dss)","#Sigma^{+} (uus)","#Sigma^{-} (dds)","e","#mu","#pi","K","p","None"]
genTag = dict(zip(genIDsuffixes,genTags))
colors_gen=[ROOT.kGreen+4,ROOT.kGreen-8,ROOT.kGreen,ROOT.kGreen+2,ROOT.kBlue,ROOT.kCyan,ROOT.kMagenta,ROOT.kRed,ROOT.kYellow,ROOT.kBlack]
gen_colors=dict(zip(genIDsuffixes,colors_gen))

histdict = {}

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
    histdict[sample]=dictToAdd
    f.Close()
        
for sample in samples:
    stackhistsST = []
    stackhistsSTC = []
    sample_outdir = outdir+"/"+sample
    for i,layer in enumerate(layers):
        isST = i < len(layers)/2
        name = sample+" "+layertag[layer]
        ths = ROOT.THStack(name,"{0} Layer Dist: {1}".format(sample_outdir,layertag[layer]))      
        ths.SetMinimum(1)
        histlist = []
        for gs in genIDsuffixes:
            hist = histdict[sample][layer][gs]
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


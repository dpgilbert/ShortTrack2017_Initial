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

if len(sys.argv) < 3:
    print "Usage: python plotter.py <infile> <outdir>"
    sys.exit(1)
infile = sys.argv[1]
outdir = sys.argv[2]
if (not os.path.exists(outdir)): os.mkdir(outdir)

f = ROOT.TFile.Open(infile)

h_isPF = f.Get("h_isPF")
h_islost = f.Get("h_islost")
h_GTonly = f.Get("h_GTonly")

histlist = [h_isPF,h_islost,h_GTonly]

histlist[0].SetTitle("Short Tracks, 2017 MINIAOD;Length Category;Count")
histlist[0].SetMinimum(0)
histlist[0].SetMaximum(1.2* max([h.GetMaximum() for h in histlist]))
histlist[0].Draw("E")
for h in histlist[1:]:
    h.Draw("sameE")

tl.AddEntry(h_isPF,"PF Cands")
tl.AddEntry(h_islost,"Lost Tracks")
tl.AddEntry(h_GTonly,"Neither")
pads[1].cd()
tl.Draw()
canvas.SaveAs("{0}/tracksByCategory.png".format(outdir))

canvas2 = ROOT.TCanvas()
canvas2.SetCanvasSize(600,600)
canvas2.cd()
h_etaphi = f.Get("h_etaphi")
h_etaphi.SetMarkerStyle(20)
h_etaphi.SetMarkerSize(0.4)
h_etaphi.Draw()
canvas2.SaveAs("etaphi.png")

h_layers = f.Get("h_layers")
h_layers.SetMinimum(0)
h_layers.Draw()
canvas2.SaveAs("layers.png")

f.Close()

#!/bin/bash

condor_submit condor_DY.cmd
condor_submit condor_TTSL_fromT.cmd
condor_submit condor_TTSL_fromTbar.cmd
condor_submit condor_TTDL.cmd
condor_submit condor_WJets.cmd
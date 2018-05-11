
universe=vanilla
when_to_transfer_output = ON_EXIT
#the actual executable to run is not transfered by its name.
#In fact, some sites may do weird things like renaming it and such.
transfer_input_files=wrapper.sh
+DESIRED_Sites="UAF"
Requirements = (Machine != "uaf-1.t2.ucsd.edu")
+Owner = undefined
log=/data/tmp/dpgilber/condor_submit_logs/LooperOutput/condor_05_09_2018.log
output=/data/tmp/dpgilber/condor_job_logs/LooperOutput/1e.$(Cluster).$(Process).out
error =/data/tmp/dpgilber/condor_job_logs/LooperOutput/1e.$(Cluster).$(Process).err
notification=Never
x509userproxy=/tmp/x509up_u31141


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_1 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_1.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_10 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_10.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_11 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_11.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_12 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_12.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_13 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_13.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_14 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_14.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_15 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_15.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_16 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_16.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_17 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_17.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_18 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_18.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_19 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_19.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_2 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_2.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_20 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_20.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_21 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_21.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_22 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_22.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_23 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_23.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_3 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_3.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_4 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_4.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_5 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_5.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_6 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_6.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_7 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_7.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_8 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_8.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_9 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-200to400_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT200to400/180508_025117/0000//ntuple_9.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT200to400 CMS4ST_DY_HT200to400
queue


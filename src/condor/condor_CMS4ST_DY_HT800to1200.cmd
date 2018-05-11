
universe=vanilla
when_to_transfer_output = ON_EXIT
#the actual executable to run is not transfered by its name.
#In fact, some sites may do weird things like renaming it and such.
transfer_input_files=wrapper.sh
+DESIRED_Sites="UAF"
Requirements = (Machine != "uaf-1.t2.ucsd.edu")
+Owner = undefined
log=/data/tmp/dpgilber/condor_submit_logs/LooperOutput/condor_05_08_2018.log
output=/data/tmp/dpgilber/condor_job_logs/LooperOutput/1e.$(Cluster).$(Process).out
error =/data/tmp/dpgilber/condor_job_logs/LooperOutput/1e.$(Cluster).$(Process).err
notification=Never
x509userproxy=/tmp/x509up_u31141


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_1 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-800to1200_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT800to1200/180506_043558/0000//ntuple_1.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT800to1200 CMS4ST_DY_HT800to1200
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_2 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-800to1200_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT800to1200/180506_043558/0000//ntuple_2.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT800to1200 CMS4ST_DY_HT800to1200
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_3 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-800to1200_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT800to1200/180506_043558/0000//ntuple_3.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT800to1200 CMS4ST_DY_HT800to1200
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_4 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-800to1200_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT800to1200/180506_043558/0000//ntuple_4.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT800to1200 CMS4ST_DY_HT800to1200
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_5 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-800to1200_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT800to1200/180506_043558/0000//ntuple_5.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT800to1200 CMS4ST_DY_HT800to1200
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_6 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-800to1200_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT800to1200/180506_043558/0000//ntuple_6.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT800to1200 CMS4ST_DY_HT800to1200
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_7 /hadoop/cms/store/user/dpgilber/DYJetsToLL_M-50_HT-800to1200_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_DY_HT800to1200/180506_043558/0000//ntuple_7.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_DY_HT800to1200 CMS4ST_DY_HT800to1200
queue


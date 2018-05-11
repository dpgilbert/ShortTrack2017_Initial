
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
arguments=ntuple_1 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_1.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_10 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_10.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_100 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_100.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_101 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_101.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_102 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_102.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_103 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_103.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_104 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_104.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_105 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_105.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_106 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_106.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_11 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_11.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_12 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_12.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_13 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_13.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_14 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_14.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_15 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_15.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_16 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_16.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_17 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_17.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_18 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_18.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_19 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_19.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_2 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_2.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_20 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_20.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_21 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_21.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_22 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_22.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_23 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_23.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_24 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_24.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_25 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_25.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_26 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_26.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_27 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_27.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_28 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_28.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_29 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_29.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_3 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_3.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_30 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_30.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_31 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_31.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_32 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_32.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_33 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_33.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_34 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_34.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_35 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_35.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_36 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_36.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_37 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_37.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_38 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_38.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_39 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_39.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_4 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_4.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_40 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_40.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_41 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_41.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_42 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_42.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_43 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_43.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_44 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_44.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_45 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_45.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_46 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_46.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_47 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_47.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_48 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_48.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_49 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_49.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_5 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_5.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_50 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_50.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_51 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_51.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_52 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_52.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_54 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_54.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_55 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_55.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_56 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_56.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_57 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_57.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_58 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_58.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_59 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_59.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_6 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_6.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_60 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_60.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_61 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_61.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_62 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_62.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_63 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_63.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_64 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_64.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_65 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_65.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_66 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_66.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_67 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_67.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_68 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_68.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_69 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_69.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_7 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_7.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_70 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_70.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_71 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_71.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_72 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_72.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_73 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_73.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_74 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_74.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_75 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_75.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_76 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_76.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_77 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_77.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_78 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_78.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_79 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_79.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_8 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_8.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_80 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_80.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_81 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_81.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_82 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_82.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_83 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_83.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_84 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_84.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_85 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_85.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_86 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_86.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_87 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_87.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_88 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_88.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_89 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_89.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_9 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_9.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_90 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_90.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_91 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_91.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_92 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_92.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_93 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_93.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_94 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_94.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_95 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_95.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_96 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_96.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_97 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_97.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_98 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_98.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


executable=wrapper.sh
transfer_executable=True
arguments=ntuple_99 /hadoop/cms/store/user/dpgilber/TTJets_SingleLeptFromT_TuneCP5_13TeV-madgraphMLM-pythia8/CMS4_from_MINIAOD_test_TTSL_FromT/180508_072855/0000//ntuple_99.root /hadoop/cms/store/user/dpgilber/LooperOutput/CMS4ST_TTSL_FromT CMS4ST_TTSL_FromT
queue


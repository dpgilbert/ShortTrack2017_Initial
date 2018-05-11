#!/bin/bash

OUTDIR=/hadoop/cms/store/user/dpgilber/LooperOutput
declare -a SAMPLES=(DYHT800to1200 DYHT200to400 QCDHT300to500 QCDHT1000to1500 TTSL_FromT)

for SAMPLE in ${SAMPLES[@]}; do
    hadd -f output/${SAMPLE}.root ${OUTDIR}/CMS4ST_${SAMPLE}/*
done

mv output/TTSL_FromT.root output/TTSL.root
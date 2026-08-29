#!/usr/bin/env bash

workpath=/directoryWhereTheMRIsAreStored
T1="${workpath}/$1"
SIF="/media/.../freesurfer_7_4_1.sif"

SUBJ_DIR="$(dirname "$(dirname "$T1")")"
DERIV="${SUBJ_DIR}/derivative"


if [ ! -e "${DERIV}/FS/scripts/recon-all.done" ]  
then 


rm -r "${DERIV}/FS"
mkdir -p "${DERIV}/"

export SUBJECTS_DIR="${DERIV}"
echo "SUBJECTS_DIR: $SUBJECTS_DIR"



export APPTAINERENV_SUBJECTS_DIR=$SUBJECTS_DIR
# export APPTAINER_BIND="$path_fs/$patient,$path/$patient,$path_brainmask/$patient,$SMSC_code_path"
export APPTAINERENV_FS_LICENSE=/media/thinkstorage/data/projects/Software/freesurfer/license.txt




apptainer exec \
    -B "$(realpath "${SUBJ_DIR}")","$(realpath "${SUBJECTS_DIR}")","$(realpath "${APPTAINERENV_FS_LICENSE}")" \
    "$SIF" \
    recon-all \
        -s FS \
        -i "$(realpath "$T1")" \
        -all \
        -parallel -openmp 4

fi


# echo apptainer exec \
#     -B "$(realpath "${SUBJ_DIR}")":"$(realpath "${SUBJ_DIR}")" \
#     "$SIF" \
#     recon-all \
#         -s FS \
#         -i "$(realpath "$T1")" \
#         -all
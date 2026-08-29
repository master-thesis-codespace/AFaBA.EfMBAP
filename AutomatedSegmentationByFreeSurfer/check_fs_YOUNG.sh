#!/usr/bin/env bash

# LIST="t1w_list_anat_from_derivates.txt"
# LIST="t1w_list_anat.txt"
LIST="t1w_list_anat_all_YOUNGall.txt"

missing="missing_fs_YOUNGall.txt"
donefile="completed_fs_YOUNGall.txt"

> "$missing"
> "$donefile"

# WORKPATH=/scicore/home/.../HC_DATA
WORKPATH=.
while IFS= read -r T1
do
    # Get subject directory
    # SUBJ_DIR="$(dirname "$(dirname "$T1")")"
    SUBJ_DIR="$T1"

    # Expected FS output
    # derivative/FS/scripts/recon-all.done  
    OUTFILE="${WORKPATH}/${SUBJ_DIR}/derivative/FS/mri/aparc.a2009s+aseg.mgz"
    OUTFILE2="${WORKPATH}/${SUBJ_DIR}/derivative/FS/scripts/recon-all.done"

    if [ -f "$OUTFILE" ] && [ -f "$OUTFILE2" ]; then
        echo "[OK] $OUTFILE"
        echo "$T1" >> "$donefile"
    else
        echo "[MISSING] $OUTFILE"
        echo "$T1" >> "$missing"
    fi

done < "$LIST"

echo "Finished checking."
echo "Completed subjects: $(wc -l < "$donefile")"
echo "Missing subjects:   $(wc -l < "$missing")"

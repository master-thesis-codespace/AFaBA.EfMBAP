for a in ABRIM/sub-*/anat/*T1w.nii.gz;do directory=$(dirname $a);sct_deepseg spinalcord -i $a -qc ~/qc;done

for a in ABRIM/sub-0*/anat/*T1w.nii.gz;do directory=$(dirname $a); sct_label_utils -i $a -create-viewer 3 -o ${directory}/label_c2c3.nii.gz;done

SOURCE_FOLDER=/shared/CIMDG/Causality-Medical-Image-Domain-Generalization/checkpoints_test/CAUSALDG_E3/22/interm_preds
TARGET_FOLDER=/shared/CIMDG/Causality-Medical-Image-Domain-Generalization/checkpoints_test/CAUSALDG_E3/22/interm_preds_resampled_chrk

mkdir $TARGET_FOLDER

for file in $SOURCE_FOLDER/*.nii.gz
do
    # echo $file
    filename=$(basename $file)
    dirname=$(dirname $file)
    idx=$(echo $filename | sed -E 's/.*CT_([0-9]+).*/\1/')
    idx=$(printf "%03d" $idx)
    new_filename=Visceral_CT_$idx.nii.gz
    echo $new_filename
    ./c3d $dirname/$filename -interpolation NearestNeighbor -resample 192x160x192 -o $TARGET_FOLDER/$new_filename
    # #./c3d $dirname/$filename -replace 5 0 6 0 -o $dirname/$filename
    # ./c3d $dirname/$filename -info
done

# Now copy with:
# scp -r -3 weihsbach@NVIDIA-DGXs-pytorch-dev-env:/shared/CIMDG/Causality-Medical-Image-Domain-Generalization/checkpoints_test/CAUSALDG_E3/22/interm_preds_resampled_chrk/ weihsbach@supergrover:/data_supergrover1/weihsbach/shared_data/tmp/Mind_Journal_2022_experiments/E3_Abdomen_MR_CT/cimdg/

SOURCE_FOLDER=/shared/CIMDG/Causality-Medical-Image-Domain-Generalization/checkpoints_test/CAUSALDG_E4/8/interm_preds
TARGET_FOLDER=/shared/CIMDG/Causality-Medical-Image-Domain-Generalization/checkpoints_test/CAUSALDG_E4/8/interm_preds_resampled_chrk

mkdir $TARGET_FOLDER

for file in $SOURCE_FOLDER/*.nii.gz
do
    # echo $file
    filename=$(basename $file)
    dirname=$(dirname $file)
    idx=$(echo $filename | sed -E 's/.*MR_([0-9]+).*/\1/')
    idx=$(printf "%03d" $idx)
    new_filename=Visceral_MR_$idx.nii.gz
    echo $new_filename
    ./c3d $dirname/$filename -interpolation NearestNeighbor -resample 192x160x192 -o $TARGET_FOLDER/$new_filename
    # #./c3d $dirname/$filename -replace 5 0 6 0 -o $dirname/$filename
    # ./c3d $dirname/$filename -info
done

# Now copy with:
# scp -r -3 weihsbach@NVIDIA-DGXs-pytorch-dev-env:/shared/CIMDG/Causality-Medical-Image-Domain-Generalization/checkpoints_test/CAUSALDG_E4/8/interm_preds_resampled_chrk/ weihsbach@supergrover:/data_supergrover1/weihsbach/shared_data/tmp/Mind_Journal_2022_experiments/E4_Abdomen_CT_MR/cimdg/

#!/bin/sh

th convert_data.lua -style photo -data_dir ./data/photo -model_dir models/photo

th train.lua -style photo -method scale -data_dir ./data/photo -model_dir models/photo -test work/scale_test_photo.png -color rgb -thread 4 -backend cudnn -random_unsharp_mask_rate 0.1 -validation_crops 160

th train.lua -style photo -method noise -noise_level 1 -data_dir ./data/photo -model_dir models/photo -test work/noise_test_photo.jpg -color rgb -thread 4 -backend cudnn -random_unsharp_mask_rate 0.5 -validation_crops 160 -nr_rate 0.6 -epoch 33

th train.lua -style photo -method noise -noise_level 2 -data_dir ./data/photo -model_dir models/photo -test work/noise_test_photo.jpg -color rgb -thread 4 -backend cudnn -random_unsharp_mask_rate 0.5 -validation_crops 160 -nr_rate 0.8 -epoch 38

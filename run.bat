SET EXPERIMENT=praa1
SET GROUP=example_group
SET NAME=example_name
SET CONFIG=projects\\neuralangelo\\configs\\custom\\%EXPERIMENT%.yaml
SET GPUS=1
torchrun --nproc_per_node=%GPUS% train.py ^
    --logdir=logs\%GROUP%\%NAME% ^
    --config=%CONFIG% ^
    --show_pbar ^
    --single_gpu
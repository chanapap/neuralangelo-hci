EXPERIMENT=praa1
GROUP=example_group
NAME=example_name
CONFIG=projects/neuralangelo/configs/custom/${EXPERIMENT}.yaml
CHECKPOINT_PATH=/neuralangelo-hci/logs/example_group/example_name/epoch_00357_iteration_000020000_checkpoint.pt
GPUS=1  # use >1 for multi-GPU training!
torchrun --nproc_per_node=${GPUS} train.py \
    --logdir=logs/${GROUP}/${NAME} \
    --config=${CONFIG} \
    --show_pbar \
    --single_gpu \
    --checkpoint=${CHECKPOINT_PATH}
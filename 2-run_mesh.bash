EXPERIMENT=praa2
GROUP=example_group
NAME=praa2
CONFIG=projects/neuralangelo/configs/custom/${EXPERIMENT}.yaml

CHECKPOINT=logs/${GROUP}/${NAME}/epoch_00035_iteration_000002000_checkpoint.pt
CONFIG=logs/${GROUP}/${NAME}/config.yaml
RESOLUTION=2048
BLOCK_RES=128
OUTPUT_MESH=logs/${GROUP}/${NAME}/praa2_mesh_${RESOLUTION}_${BLOCK_RES}_texturefirst.ply
GPUS=1  # use >1 for multi-GPU mesh extraction
torchrun --nproc_per_node=${GPUS} projects/neuralangelo/scripts/extract_mesh.py \
    --textured \
    --config=${CONFIG} \
    --checkpoint=${CHECKPOINT} \
    --output_file=${OUTPUT_MESH} \
    --resolution=${RESOLUTION} \
    --block_res=${BLOCK_RES} 
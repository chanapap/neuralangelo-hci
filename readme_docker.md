docker build -t neuralangelo:latest -f Dockerfile-neuralangelo .

# volume path where you already have the datasets
# volume code fo easy editing
docker run -it -v E:\3d-recon\datasets:/datasets/ -v E:\3d-recon\neuralangelo:/neuralangelo/ --name neural_container --gpus all neuralangelo:latest

bash run.bash
bash projects/neuralangelo/scripts/preprocess.sh
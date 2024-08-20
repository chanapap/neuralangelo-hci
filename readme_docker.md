docker build -t neuralangelo:latest -f Dockerfile-neuralangelo .

docker run -it -v E:\3d-recon\datasets:/datasets/ -v E:\3d-recon\neuralangelo:/neuralangelo/ --name neural_container --gpus all neuralangelo:latest

bash projects/neuralangelo/scripts/preprocess.sh
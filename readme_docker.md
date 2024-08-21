docker build -t neuralangelo:latest -f Dockerfile-neuralangelo .

# volume path where you already have the datasets
# volume code fo easy editing
docker run -it -v E:\3d-recon\datasets:/datasets/ -v E:\3d-recon\neuralangelo-hci:/neuralangelo-hci/ --shm-size 50G --name neural_container --gpus all neuralangelo:latest

bash projects/neuralangelo/scripts/preprocess.sh
bash 1-run_train.bash
bash 2-run_mesh.bash
# HCI Run Neuralangelo on Docker

1. Build Docker Image

```
docker build -t neuralangelo:latest -f Dockerfile-neuralangelo .
```

2. Run Docker Container

    - volume path where you already have the datasets
    - volume code fo easy code editing

    ```
    docker run -it -v E:\3d-recon\datasets:/datasets/ -v E:\3d-recon\neuralangelo-hci:/neuralangelo-hci/ --shm-size 50G --name neural_container --gpus all neuralangelo:latest
    ```

    - Inside the Container Do this ...

    ```
    conda activate neuralangelo
    pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch
    ```

3. Run Neuralangelo
    
```
# Preprocess the dataset (start from video.mp4)
bash projects/neuralangelo/scripts/preprocess.sh
# Train Neuralangelo
bash 1-run_train.bash
# Extract Mesh
bash 2-run_mesh.bash
```

If any .sh file got error try running 

```
sed -i 's/\r$//' filename.sh
```

### Output Folder Format

![Alt text](img/output_folder_format.png?raw=true "Output Folder Format")
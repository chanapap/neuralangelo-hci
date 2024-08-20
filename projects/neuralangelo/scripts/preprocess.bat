@REM .\\projects\\neuralangelo\\scripts\\preprocess.bat

SET SEQUENCE=praa1
SET PATH_TO_VIDEO=E:\3d-recon\datasets\praa1-neu\video.mp4
SET FPSRATE=2
SET SCENE_TYPE=object

SET data_path=datasets\%SEQUENCE%_ds%FPSRATE%

SET image_path=%data_path%\images_raw

mkdir %image_path%
ffmpeg -i %PATH_TO_VIDEO% -qscale:v 1 -qmin 1 -vf fps=%FPSRATE% %image_path%\%%03d.jpg

colmap feature_extractor ^
    --database_path=%data_path%\database.db ^
    --image_path=%data_path%\images_raw ^
    --ImageReader.camera_model=PINHOLE ^
    --ImageReader.single_camera=true ^^
    --SiftExtraction.use_gpu=true ^
    --SiftExtraction.num_threads=32

colmap sequential_matcher ^
    --database_path=%data_path%\database.db ^
    --SiftMatching.use_gpu=true

mkdir %data_path%\sparse
colmap mapper ^
    --database_path=%data_path%\database.db ^
    --image_path=%data_path%\images_raw ^
    --output_path=%data_path%\sparse

copy "%data_path%\sparse\0\*.bin" "%data_path%\sparse\"

colmap image_undistorter ^
    --image_path=%data_path%\images_raw ^
    --input_path=%data_path%\sparse ^
    --output_path=%data_path% ^
    --output_type=COLMAP


python projects\neuralangelo\scripts\convert_data_to_json.py --data_dir %data_path% --scene_type %SCENE_TYPE%
python projects\neuralangelo\scripts\generate_config.py --sequence_name %SEQUENCE% --data_dir %data_path% --scene_type %SCENE_TYPE%

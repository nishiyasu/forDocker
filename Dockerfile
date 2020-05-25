FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive

# opencv-devのインストール
RUN apt-get update -y && apt-get install -y python3\
	python3-pip\
	libopencv-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Opencvとpytorchのインストール
RUN pip3 install numpy opencv-python 
RUN pip3 install torch torchvision

ENV APP_NAME torch-docker
WORKDIR /home/$APP_NAME

CMD [ '/bin/bash'  ]

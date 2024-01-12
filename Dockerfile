FROM ubuntu:20.04

COPY sources_bionic.list /etc/apt/sources.list

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
	&& apt-get install -y python3 python3-dev python3-pip gcc vim libprotobuf-dev zlib1g zlib1g-dev libsm6 \
	&& apt-get install -y libgl1 libglib2.0-0 android-tools-adb \
	&& apt-get install -y cmake libeigen3-dev libopencv-dev

RUN cp -r /usr/include/eigen3/Eigen /usr/local/include 


RUN cd /usr/bin \
	&& ln -sfn idle3 idle \
	&& ln -sfn pydoc3 pydoc \
	&& ln -sfn python3 python \
	&& ln -sfn python3-config python-config \
	&& ln -sfn pip3 pip \
	&& ls -al

RUN python -m pip install --upgrade pip -i https://mirror.baidu.com/pypi/simple --trusted-host=mirror.baidu.com
RUN pip3 config set global.index-url https://mirror.baidu.com/pypi/simple
RUN pip3 config set install.trusted-host mirror.baidu.com

RUN python3 --version
RUN pip3 --version
COPY rknn_toolkit_lite2-1.6.0-cp38-cp38-linux_aarch64.whl rknn_toolkit_lite2-1.6.0-cp38-cp38-linux_aarch64.whl
RUN pip3 install rknn_toolkit_lite2-1.6.0-cp38-cp38-linux_aarch64.whl

COPY 
VOLUME /root/yolov5_Deepsort_rknn/data
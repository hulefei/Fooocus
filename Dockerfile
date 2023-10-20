# FROM nvidia/cuda:12.1.0-runtime-ubuntu22.04

# RUN apt-get update && apt-get install -y libgl1-mesa-glx    

# RUN apt-get update && \
#     apt-get install --no-install-recommends -y python3 python3-pip && \
#     rm -rf /var/lib/apt/lists/*

# RUN --mount=type=cache,target=/root/.cache/pip pip3 install virtualenv
# RUN mkdir /app

# WORKDIR /app

# RUN virtualenv /venv
# RUN . /venv/bin/activate && \
#     pip3 install --upgrade pip

# COPY requirements_versions.txt /app/requirements_versions.txt
# RUN . /venv/bin/activate && \
#     pip3 install -r requirements_versions.txt
FROM nvidia/cuda:12.2.0-base-ubuntu22.04
ENV DEBIAN_FRONTEND noninteractive

# RUN mkdir /app
# WORKDIR /app

RUN apt-get update -y && \
	apt-get install -y aria2 libgl1 libglib2.0-0 wget git git-lfs python3-pip python-is-python3 && \
	pip install -q torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2+cu118 torchtext==0.15.2 torchdata==0.6.1 --extra-index-url https://download.pytorch.org/whl/cu118 && \
	pip install xformers==0.0.20 triton==2.0.0 packaging==23.1 pygit2==1.12.2 && \
	adduser --disabled-password --gecos '' user && \
	mkdir /app && \
	chown -R user:user /app

COPY . /app/
USER user

COPY requirements_versions.txt /app/requirements_versions.txt
RUN pip install -r /app/requirements_versions.txt

# ENTRYPOINT [ "bash", "-c", ". /venv/bin/activate && exec \"$@\"", "--" ]
CMD [ "python3", "/app/entry_with_update.py", "--listen" ]
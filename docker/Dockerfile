FROM python:3.9.7-slim-bullseye

RUN apt-get update 
RUN  apt install gcc build-essential -y \
		libssl-dev -y \
		libffi-dev -y \
    python3-dev -y \
    libpq-dev -y \
    musl-dev -y \
    make -y \
		curl -y \
		git -y 
RUN apt-get clean
# RUN rm -rf /var/lib/apt/lists/*

# logs
ENV PYTHONUNBUFFERED 1

# set up virtualenv
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# set working directory
RUN mkdir /workspace
WORKDIR /workspace/

# install required libraries
COPY requirements.txt /workspace/
RUN pip install -r requirements.txt

# Bind src & tests in docker-compose.yml

# copy source code into working directory
COPY ./entrypoint.sh /workspace/
COPY ./launch_app.py /workspace/
COPY ./Makefile /workspace/
COPY data /workspace/data

############### sugar ###############
RUN apt install -y vim
COPY ./docker/.bashrc /workspace/docker/
RUN cat ./docker/.bashrc >> ~/.bashrc && \
    rm -rf ./docker/
RUN pip install flake8==4.0.1
############### /sugar ###############

# Run the app
# ENTRYPOINT [ "/workspace/entrypoint.sh start-worker" ]
CMD [ "python" ]
# CMD gunicorn --bind 0.0.0.0:5000 myappname.app:app -w 4 -k uvicorn.workers.UvicornWorker --access-logfile - --error-logfile - --log-level info

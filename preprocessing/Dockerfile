FROM python:3.11.4-slim

ARG DATA_FILE=iris.csv
ARG DATA_URL=https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv

WORKDIR /app

COPY requirements.txt ./
COPY preprocessing.py ./

ADD $DATA_URL $DATA_FILE

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    mkdir data && \
    useradd -u $HOST_UID -d appuser && \
    chown -R appuser:appuser /app

USER appuser
CMD ["python", "preprocessing.py"]
FROM python:3.11.4-slim

COPY requirements.txt /app/
COPY training.py /app/

WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    mkdir /data

ENV TARGET_NAME=variety

CMD ["python", "training.py"]
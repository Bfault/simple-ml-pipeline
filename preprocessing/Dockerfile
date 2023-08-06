FROM python:3.11.4-slim

COPY requirements.txt /app/
COPY preprocessing.py /app/

WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    mkdir /data

ENV TRAINING_SIZE=1

CMD ["python", "preprocessing.py"]
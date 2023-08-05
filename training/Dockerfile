FROM python:3.11.4-slim

WORKDIR /app

COPY requirements.txt ./
COPY training.py ./

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    useradd -u $HOST_UID appuser && \
    chown -R appuser:appuser /app

USER appuser
CMD ["python", "training.py"]
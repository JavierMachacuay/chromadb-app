FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /data
VOLUME ["/data"]

EXPOSE 8000

RUN adduser --disabled-password appuser
USER appuser

CMD ["chroma", "run", "--host", "0.0.0.0", "--port", "8000", "--path", "/data"]

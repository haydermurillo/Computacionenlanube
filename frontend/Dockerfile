FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    gcc \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

#COPY requirements.txt requirements.txt

COPY . .

RUN pip install -r requirements.txt

ENV FLASK_APP=./run.py

EXPOSE 5001

CMD ["flask", "run", "--host=0.0.0.0", "--port=5001"]

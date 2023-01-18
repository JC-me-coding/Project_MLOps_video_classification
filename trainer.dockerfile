
FROM python:3.9.1-slim-buster

RUN apt update && \
    apt install --no-install-recommends -y build-essential gcc && \
    apt clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt

COPY setup.py setup.py
COPY src/ src/
COPY config/ config/
COPY scripts/ scripts/
COPY Makefile Makefile

RUN pip install -r requirements.txt --no-cache-dir

WORKDIR /

ENTRYPOINT ["scripts/trainer.sh"]

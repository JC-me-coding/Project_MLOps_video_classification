
FROM python:3.9.1-slim-buster

# install python
RUN apt update && \
    apt install --no-install-recommends -y build-essential gcc && \
    apt clean && rm -rf /var/lib/apt/lists/*

COPY core_requirements.txt core_requirements.txt
COPY setup.py setup.py
COPY src/ src/
COPY data/ data/

WORKDIR /
RUN pip install -r core_requirements.txt --no-cache-dir

ENTRYPOINT ["python", "-u", "src/main.py"]
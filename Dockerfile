FROM python:3.11-slim-bookworm AS base

RUN apt-get update && \
    apt-get install -y libmagic-dev poppler-utils tesseract-ocr ffmpeg libsm6 libxext6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN adduser --uid 1000 --disabled-password --gecos '' appuser
USER 1000

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/home/appuser/.local/bin:$PATH"

RUN pip install --user --no-cache-dir --upgrade pip

COPY ./requirements.txt /home/appuser/requirements.txt
RUN pip install --user --no-cache-dir  --upgrade -r /home/appuser/requirements.txt

WORKDIR /home/appuser

CMD ["/bin/bash"]

FROM base AS ready

COPY ./dockerinit /home/appuser/.dockerinit
RUN python /home/appuser/.dockerinit/download_models.py

CMD ["/bin/bash"]

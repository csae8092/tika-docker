FROM apache/tika:latest-full

# Install German language data for Tesseract
USER root
RUN apt-get update && \
    apt-get install -y tesseract-ocr-deu && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER tika

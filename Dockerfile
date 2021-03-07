FROM python:3.10.0a6-slim-buster
LABEL maintainer="Thomas Gorgolione <thomas@tgorg.com>"

RUN apt-get update && apt-get install --no-install-recommends --yes ffmpeg
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
COPY *.py /app/
COPY cache/ /app/cache/
COPY lib/ /app/lib/
COPY known_stations.json /app/
RUN touch /app/is_container

ENTRYPOINT ["python3", "/app/main.py"]

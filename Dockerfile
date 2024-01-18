# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.9-slim

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image.
WORKDIR /app
COPY . .

# Install production dependencies.
RUN pip install fastapi uvicorn

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.

# CMD exec uvicorn aggregate_posts:app --host 0.0.0.0 --port ${PORT}

CMD uvicorn main:app --host 0.0.0.0 --port ${PORT}
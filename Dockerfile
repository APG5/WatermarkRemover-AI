# Use a Python base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . /app/

# Set the default command for the container
ENTRYPOINT ["python", "remwm.py"]
CMD []

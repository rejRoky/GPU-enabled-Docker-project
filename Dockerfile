# Base image with CUDA and Ubuntu
FROM nvidia/cuda:11.8.0-runtime-ubuntu20.04

# Set working directory
WORKDIR /app

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the Python dependencies first (for better layer caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Use a non-root user for security (optional)
RUN useradd -m appuser && chown -R appuser /app
USER appuser

# Command to run your application
CMD ["python3", "app.py"]

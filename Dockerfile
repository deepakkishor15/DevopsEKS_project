# Use a minimal Python image
FROM python:3.9-slim

WORKDIR /app

# Copy and install dependencies inside a virtual environment
COPY requirements.txt .
RUN python -m venv venv && \
    ./venv/bin/pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Expose Flask port
EXPOSE 5000

# Run Flask app using virtual environment
CMD ["./venv/bin/python", "app.py"]

# Use official Python base image
FROM python:3.10-slim

# Install nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copy app files
WORKDIR /app
COPY app.py requirements.txt start.sh nginx.conf ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy nginx config to proper location
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start both python app and nginx
CMD ["./start.sh"]

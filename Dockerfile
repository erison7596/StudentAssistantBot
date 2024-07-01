# Use Rasa base image
FROM rasa/rasa:3.0.0

# Use subdirectory as working directory
WORKDIR /app

# Copy everything to /app
COPY . /app

# Update pip and install additional requirements as root
USER root
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Train the model
RUN rasa train

# Expose necessary ports
EXPOSE 5005
EXPOSE 5055
EXPOSE 8000

# By best practices, don't run as root
USER 1001

# Run the custom Flask server script
CMD ["python", "run_server.py"]

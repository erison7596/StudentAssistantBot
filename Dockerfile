# Use Rasa base image
FROM rasa/rasa:3.0.0

# Use subdirectory as working directory
WORKDIR /app

# Copy everything to /app
COPY . /app

# Install additional requirements
RUN pip install -r requirements.txt

# By best practices, don't run as root
USER 1001

# Run the server(s)
CMD ["start", "--actions", "actions", "--cors", "*", "--enable-api"]

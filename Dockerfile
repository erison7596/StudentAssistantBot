FROM python:3.10-slim

# Diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar os arquivos de requisitos para o diretório de trabalho
COPY requirements.txt .

# Instalar dependências do sistema e do Python
RUN apt-get update && apt-get install -y build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

# Copiar todo o projeto para o diretório de trabalho
COPY . .

# Expor a porta 5005
EXPOSE 5005

# Run the server
CMD ["rasa", "run", "--enable-api", "--cors", "*"]

# Use Python base image
FROM python:3.10-slim

# Diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar os arquivos de requisitos para o diretório de trabalho
COPY requirements.txt .

# Instalar dependências do sistema e do Python
RUN apt-get update && apt-get install -y build-essential \
    && pip install --upgrade pip \
    && pip install -r requirements.txt \
    && pip install flask-cors  # Instalar o flask-cors

# Copiar o restante do código da aplicação
COPY . .

# Expor as portas necessárias
EXPOSE 5005

# Comando para rodar a aplicação
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]

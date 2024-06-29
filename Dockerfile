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

# Copiar o script de inicialização
COPY run_server.py /run_server.py

# Comando para rodar a aplicação
ENTRYPOINT ["python", "/run_server.py"]

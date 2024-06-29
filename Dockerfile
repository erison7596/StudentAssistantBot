FROM python:3.10-slim

# Diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar os arquivos de requisitos para o diretório de trabalho
COPY requirements.txt .

# Instalar dependências do sistema e do Python
RUN apt-get update && apt-get install -y build-essential \
    && pip install --upgrade pip \
    && pip install -r requirements.txt 

# Copiar o restante do código da aplicação
COPY . .

# Copiar o script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Comando para rodar a aplicação
ENTRYPOINT ["/entrypoint.sh"]

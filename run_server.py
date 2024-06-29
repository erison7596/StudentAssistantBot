# run_server.py
from flask import Flask
from flask_cors import CORS
import subprocess
import threading

# Crie uma instância do Flask
app = Flask(__name__)

# Configure CORS para permitir todas as origens
CORS(app, resources={r"/*": {"origins": "*"}})

# Função para iniciar o servidor Rasa
def start_rasa():
    subprocess.call(["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"])

# Função para iniciar o servidor de ações
def start_actions():
    subprocess.call(["rasa", "run", "actions", "--port", "5055"])

# Inicie o servidor Rasa em uma thread separada
threading.Thread(target=start_rasa).start()

# Inicie o servidor de ações em uma thread separada
threading.Thread(target=start_actions).start()

# Adicione uma rota de exemplo para verificar se o Flask está funcionando
@app.route('/')
def home():
    return 'CORS habilitado para todas as rotas!'

if __name__ == '__main__':
    # Inicie o servidor Flask
    app.run(host='0.0.0.0', port=8000)

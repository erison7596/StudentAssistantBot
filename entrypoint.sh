#!/bin/bash

# Iniciar ações do Rasa
rasa run actions &

# Iniciar o servidor Rasa
rasa run --enable-api --cors "*" --debug

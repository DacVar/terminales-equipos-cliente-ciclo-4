#!/usr/bin/env bash
# Verifica que la instalación quedó como dice la descripción.
# Se corre después de instalar.sh. No arregla nada: solo compara y reporta.
set -euo pipefail
cd "$(dirname "$0")"

echo "== Equipo"
echo "Sistema: $(uname -s)"
echo "Python del proyecto: $(.venv/bin/python --version)"

echo "== Dependencias: lo instalado contra lo declarado"
if diff <(.venv/bin/python -m pip freeze | sort) <(sort requirements.txt); then
  echo "OK: lo instalado es idéntico a requirements.txt"
else
  echo "DIFERENCIA: lo instalado no coincide con requirements.txt" >&2
  exit 1
fi

echo "== Base de datos"
if [ -f registro.db ]; then
  echo "OK: registro.db existe"
else
  echo "FALTA: registro.db no existe" >&2
  exit 1
fi

echo "Verificación completa: el equipo coincide con la descripción."

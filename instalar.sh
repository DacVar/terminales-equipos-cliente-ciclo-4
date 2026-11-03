#!/usr/bin/env bash
# Instala el Registro de Visitas en un equipo limpio.
# Sistema: Linux (probado en GitHub Codespaces). Python: 3.12
set -euo pipefail

# Trabajar siempre desde la carpeta del proyecto, se llame desde donde se llame
cd "$(dirname "$0")"

# --- Precondiciones: el equipo debe ser el que este guion espera ---
SO_ESPERADO="Linux"
PYTHON_ESPERADO="3.12"

SO_REAL="$(uname -s)"
if [ "$SO_REAL" != "$SO_ESPERADO" ]; then
  echo "Este guion es para $SO_ESPERADO y este equipo es $SO_REAL. Se detiene." >&2
  exit 1
fi

PYTHON_REAL="$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
if [ "$PYTHON_REAL" != "$PYTHON_ESPERADO" ]; then
  echo "Este guion se verificó con Python $PYTHON_ESPERADO y este equipo tiene $PYTHON_REAL. Se detiene." >&2
  exit 1
fi

# 1. Ambiente aislado para el proyecto
python3 -m venv .venv

# 2. Dependencias con versión fijada
.venv/bin/python -m pip install -r requirements.txt

# 3. Base de datos (estado previo que la aplicación necesita)
.venv/bin/python crear_db.py

echo "Instalación lista. Para verificar: bash verificar.sh · Para arrancar: bash arrancar.sh"

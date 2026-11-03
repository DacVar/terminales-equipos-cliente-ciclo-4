#!/usr/bin/env bash
# Arranca el Registro de Visitas. Requiere haber corrido instalar.sh antes.
set -euo pipefail
cd "$(dirname "$0")"

# La clave NO va en este archivo: se define en el entorno de quien arranca
if [ -z "${REGISTRO_CLAVE:-}" ]; then
  echo "Falta REGISTRO_CLAVE. En Linux se define así: export REGISTRO_CLAVE=tu_clave" >&2
  exit 1
fi

# La aplicación guarda la hora del equipo: se fija la zona horaria de Colombia
export TZ="America/Bogota"

.venv/bin/python app.py

#!/usr/bin/env bash
# Prepara el servidor de pruebas del Registro de Visitas.
# Momento 1 de la Fase 3: así quedó en el reto, escrito como lista de pasos.
# No se corrige. Con la segunda corrida se cae en useradd.
set -euo pipefail
cd "$(dirname "$0")"

# 1. sqlite3
sudo apt-get update
sudo apt-get install -y sqlite3

# 2. Usuario de sistema
sudo useradd --system registro

# 3. Carpeta y archivos
sudo mkdir /opt/registro
sudo cp app.py crear_db.py requirements.txt /opt/registro/

# 4. Base de datos y visita de verificación
sudo env REGISTRO_DB=/opt/registro/registro.db python3 /opt/registro/crear_db.py
sudo sqlite3 /opt/registro/registro.db "INSERT INTO visitas (nombre, momento) VALUES ('Prueba de aprovisionamiento', '2026-10-27 18:30');"

# 5. Configuración
echo "TZ=America/Bogota" | sudo tee -a /opt/registro/registro.env
echo "REGISTRO_DB=/opt/registro/registro.db" | sudo tee -a /opt/registro/registro.env

# 6. Dueño
sudo chown -R registro:registro /opt/registro

# 7. Aviso
echo 'echo "*** SERVIDOR DE PRUEBAS - Registro de Visitas ***"' >> ~/.bashrc

echo "Servidor de pruebas listo."

# Registro de Visitas

Aplicación web sencilla para registrar visitantes. Guarda un nombre y la fecha
y hora en que se registró, y muestra la lista.

## Equipo de desarrollo (Fase 2)

**Sistema:** Linux (probado en GitHub Codespaces) · **Python:** 3.12

`instalar.sh` revisa las dos condiciones antes de empezar y se detiene si el
equipo no es el esperado.

```
bash instalar.sh
bash verificar.sh
export REGISTRO_CLAVE=tu_clave
bash arrancar.sh
```

Después abrir la pestaña **Ports** del Codespace (puerto 5000).

- `instalar.sh`: ambiente virtual `.venv`, dependencias de `requirements.txt`
  (versiones fijadas) y base de datos.
- `verificar.sh`: compara lo instalado contra `requirements.txt` y revisa la
  base. No arregla nada.
- `arrancar.sh`: exige `REGISTRO_CLAVE` en el entorno y fija la zona horaria
  `America/Bogota` antes de arrancar.


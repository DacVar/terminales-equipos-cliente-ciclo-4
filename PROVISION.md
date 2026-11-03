# Registro de provisión — Fase 3

## Verificación de idempotencia

### 27-oct · primer playbook (3 tareas)
1.ª corrida: (pega aquí el PLAY RECAP)
2.ª corrida: (pega aquí el PLAY RECAP)

### 27-oct · playbook con condiciones 1, 3, 5, 6
1.ª corrida: (pega aquí el PLAY RECAP)
2.ª corrida: (pega aquí el PLAY RECAP)

### Romper algo a propósito
Borré `/opt/registro/registro.env` a mano y corrí el playbook: (pega aquí el PLAY RECAP — debe decir changed=1)

## La visita de verificación (pendiente)

Qué pasó en dos corridas: la tarea `command` salió `changed` las dos veces y la base quedó con dos visitas.
Por qué pasa: Ansible no sabe qué hace un comando suelto; `command` vuelve a ser una lista de pasos.
Cómo creo que se podría evitar (idea, no código): preguntar primero cuántas visitas de verificación hay, y agregarla solo si hay cero.

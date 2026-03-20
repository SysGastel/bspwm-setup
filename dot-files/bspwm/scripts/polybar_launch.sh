#!/bin/bash

#terminar cualquier instancia previa de polybar
pkill -9 polybar
#esperar a que los procesos hayan cerrado
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#lanzar la barra 
polybar example -c ~/.config/polybar/config.ini &

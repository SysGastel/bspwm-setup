#!/usr/bin/env bash

#terminar barra anteriores
killall -q polybar

#esperar que los procesos se detengan
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#lanzar la barra example
polybar example &

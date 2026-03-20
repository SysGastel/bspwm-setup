#!bin/bash

#VARIABLES ========================================================================
VERDE='\e[32m'
ROJO='\e[31m'
RESET='\e[0m'
echo -e "${VERDE} Instalando servidor grafico, modulos de bluetooh y brillo${RESET}"

#Instalacion del sevidor grafico y algunas herramientaas. =========================
GRAPHIC_SETUP="xorg bspwm polybar feh git curl wget lightdm light-locker"
#Ejecucion Limpia
apt install $GRAPHIC_SETUP -y

#Definicion de modulos (bluetooth y brillo) =======================================
echo -e "${VERDE} Instalando los modulos para bluetooth y brillo${RESET}"
BLUETOOTH="pipewire pulseaudio pulsemixer  brightnessctl"
#Ejecucion limpia
apt install $BLUETOOTH -y 

#Estructura de directorios ========================================================
echo -e "${VERDE} creando estructura de directorios en ~/.config${RESET}"
HOME_DIR="$HOME"
mkdir -p "$HOME_DIR/.config"
TEMP_DIR="/tmp/dotfiles"
git clone https://github.com/sysgastel/bspwm-setup.git "$TEMP_DIR"
cp -rv "$TEMP_DIR"/* "$HOME_DIR/.config/"
rm -rf "$TEMP_DIR"



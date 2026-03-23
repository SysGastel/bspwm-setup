#!/bin/bash

#VARIABLES ========================================================================
VERDE='\e[32m'
ROJO='\e[31m'
RESET='\e[0m'

#Instalacion del sevidor grafico y algunas herramientaas. =========================
echo -e "${VERDE} Instalando servidor grafico, modulos de bluetooh y brillo${RESET}"
GRAPHIC_SETUP="xorg bspwm polybar picom zsh gzip kitty rofi nmap firefox-esr feh git curl wget lightdm light-locker btop htop cmatrix"
#Ejecucion Limpia
sudo apt install $GRAPHIC_SETUP -y

#Instalacion de fonts.
echo -e "${VERDE} Instalando fuentes para iconos...${RESET}"
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip -P /tmp
unzip -o /tmp/JetBrainsMono.zip -d ~/.local/share/fonts
fc-cache -fv


#Definicion de modulos (bluetooth y brillo) =======================================
echo -e "${VERDE} Instalando los modulos para bluetooth y brillo${RESET}"
BLUETOOTH="pipewire pulseaudio pulsemixer  brightnessctl"
#Ejecucion limpia
sudo apt install $BLUETOOTH -y 

#Estructura de directorios ========================================================
echo -e "${VERDE} creando estructura de directorios en ~/.config${RESET}"
HOME_DIR="$HOME"
mkdir -p "$HOME_DIR/.config"
TEMP_DIR="/tmp/dotfiles"
git clone https://github.com/sysgastel/bspwm-setup.git "$TEMP_DIR"
cp -rv "$TEMP_DIR/dot-files/"* "$HOME_DIR/.config/"
rm -rf "$TEMP_DIR"
echo -e "${VERDE}Configuraciòn completada con èxito.${RESET}"

#damos permiso de ejecucion a los archivos de configuracion que terminan con *rc
echo -e "${VERDE} otorgando permisos de ejecucion para bspwmrc y sxhkcrc"
chmod +x "$HOME_DIR/.config/bspwm/bspwmrc"
chmod +x "$HOME_DIR/.config/sxhkd/sxhkdrc"

# --- Instalación de oh my zsh y Powerlevel10k ---
echo "${VERDE}Instalando oh my zsh y temas...${RESET}"

#Clonar Oh My Zsh (opcional pero recomendado para plugins)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#Clonar Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#Configurar Zsh como shell por defecto (esto pedirá contraseña al usuario)
chsh -s $(which zsh)

echo -e "${VERDE}Instalación de Zsh completada. Al reiniciar la terminal, se ejecutará el asistente de p10k.${RESET}"

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

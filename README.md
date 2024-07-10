# GNOME UI Font

This repository contains the CI file used to build GNOME UI, an [Inter](https://rsms.me/inter/) based font.

## Getting the Font

### Installing Manually

Dependences:
- `wget`
- `unzip`
- `opentype-feature-freezer`

```sh
wget https://github.com/rsms/inter/releases/download/v4.0/Inter-4.0.zip
unzip Inter-4.0.zip -d Inter-4.0
cd Inter-4.0
pyftfeatfreeze --features "ss04" --replacenames "Inter Variable/GNOME UI" InterVariable.ttf GNOMEUI.ttf
mkdir ~/.local/share/fonts && mv GNOMEUI.tff ~/.local/share/fonts
gsettings set org.gnome.desktop.interface font-name "GNOME UI 11"
gsettings set org.gnome.desktop.interface document-font-name "GNOME UI 11"
```

### Resetting Font

```sh
gsettings reset org.gnome.desktop.interface font-name
gsettings reset org.gnome.desktop.interface document-font-name
```

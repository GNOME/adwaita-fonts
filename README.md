# GNOME UI Font

This repository contains the CI file used to build the GNOME UI font, a variation of [Inter](https://rsms.me/inter/).

## Getting the Font

### Prebuilt

The latest version can be downloaded [here](https://gitlab.gnome.org/GNOME/gnome-ui-font/-/pipelines). Install it by double clicking on the .ttf file and clicking on the install button.

### Generating Manually

Dependencies:
- `wget`
- `unzip`
- `opentype-feature-freezer`

```sh
wget https://github.com/rsms/inter/releases/download/v4.0/Inter-4.0.zip
unzip Inter-4.0.zip -d Inter-4.0
cd Inter-4.0
pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/GNOME UI" InterVariable.ttf GNOMEUI.ttf
mkdir -p ~/.local/share/fonts && mv GNOMEUI.tff ~/.local/share/fonts
```

### Setting the Font

```sh
gsettings set org.gnome.desktop.interface font-name "GNOME UI 11"
gsettings set org.gnome.desktop.interface document-font-name "GNOME UI 11"
```

### Resetting Font

```sh
gsettings reset org.gnome.desktop.interface font-name
gsettings reset org.gnome.desktop.interface document-font-name
```

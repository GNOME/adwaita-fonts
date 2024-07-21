# GNOME UI Font

This repository contains the Makefile used to build the GNOME UI font, a variation of [Inter](https://rsms.me/inter/).

## Getting the Font

### Prebuilt

The latest version can be downloaded [here](https://gitlab.gnome.org/GNOME/gnome-ui-font/-/pipelines). Install it by double clicking on the .ttf files and clicking on the install button.

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

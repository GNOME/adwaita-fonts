# Adwaita Fonts

This repository contains the Makefile used to build Adwaita Sans, a variation of [Inter](https://rsms.me/inter/), and Adwaita Mono, to be decided.

## Getting the Fonts

### Prebuilt

The latest version of Adwaita Sans can be downloaded [here](https://gitlab.gnome.org/GNOME/adwaita-fonts/-/pipelines). Install it by double clicking on the .ttf files and clicking on the install button.

### Setting the Fonts

```sh
gsettings set org.gnome.desktop.interface font-name "Adwaita Sans 11"
```

### Resetting Fonts

```sh
gsettings reset org.gnome.desktop.interface font-name
```

PREFIX="/usr"
DESTDIR="/"

SANS_ARCHIVE="Inter-4.1.zip"
SANS_SHA256="9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e"
SANS_FONT_FILENAMES=InterVariable.ttf InterVariable-Italic.ttf

MONO_ARCHIVE="PkgTTF-IosevkaFixedSS04-32.4.0.zip"
MONO_SHA256="9c004c687675fa0b02d63c6d7c50d0f69a0c5e97ee3228f5e6a09d05f44f239e"
MONO_FONT_FILENAMES=IosevkaFixedSS04-Extended.ttf \
	IosevkaFixedSS04-ExtendedItalic.ttf \
	IosevkaFixedSS04-ExtendedBold.ttf \
	IosevkaFixedSS04-ExtendedBoldItalic.ttf

ADWAITA_FONT_FILENAMES=AdwaitaSans.ttf AdwaitaSans-Italic.ttf

all: $(ADWAITA_FONT_FILENAMES)

sans:
	echo "$(SANS_SHA256) $(SANS_ARCHIVE)" | sha256sum --check --status
	unzip -o $(SANS_ARCHIVE) $(SANS_FONT_FILENAMES)

AdwaitaSans.ttf: sans
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable.ttf $@

AdwaitaSans-Italic.ttf: sans
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable-Italic.ttf $@

mono:
	echo "$(MONO_SHA256) $(MONO_ARCHIVE)" | sha256sum --check --status
	unzip -o $(MONO_ARCHIVE) $(MONO_FONT_FILENAMES)

AdwaitaMono.ttf: mono
	pyftfeatfreeze --replacenames "Iosevka Fixed SS04/Adwaita Mono" IosevkaFixedSS04-Extended.ttf $@

AdwaitaMono-Italic.ttf: mono
	pyftfeatfreeze --replacenames "Iosevka Fixed SS04/Adwaita Mono" IosevkaFixedSS04-ExtendedItalic.ttf $@

AdwaitaMono-Bold.ttf: mono
	pyftfeatfreeze --replacenames "Iosevka Fixed SS04/Adwaita Mono" IosevkaFixedSS04-ExtendedBold.ttf $@

AdwaitaMono-BoldItalic.ttf: mono
	pyftfeatfreeze --replacenames "Iosevka Fixed SS04/Adwaita Mono" IosevkaFixedSS04-ExtendedBoldItalic.ttf $@

install: $(ADWAITA_FONT_FILENAMES)
	install -Dm655 -t "$(DESTDIR)/$(PREFIX)/share/fonts/Adwaita" $(ADWAITA_FONT_FILENAMES)

clean:
	rm *.ttf

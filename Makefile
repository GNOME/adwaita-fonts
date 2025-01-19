PREFIX="/usr"
DESTDIR="/"

SANS_ARCHIVE="Inter-4.1.zip"
SANS_SHA256="9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e"
SANS_FONT_FILENAMES=InterVariable.ttf InterVariable-Italic.ttf


ADWAITA_FONT_FILENAMES=AdwaitaSans.ttf AdwaitaSans-Italic.ttf

all: $(ADWAITA_FONT_FILENAMES)

sans:
	echo "$(SANS_SHA256) $(SANS_ARCHIVE)" | sha256sum --check --status
	unzip -o $(SANS_FILENAME) $(SANS_FONT_FILENAMES)

AdwaitaSans.ttf: sans
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable.ttf $@

AdwaitaSans-Italic.ttf: sans
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable-Italic.ttf $@

install: $(ADWAITA_FONT_FILENAMES)
	install -Dm655 -t "$(DESTDIR)/$(PREFIX)/share/fonts/Adwaita" $(ADWAITA_FONT_FILENAMES)

clean:
	rm *.ttf

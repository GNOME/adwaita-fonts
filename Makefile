INTER_FILENAME="Inter-4.1.zip"
INTER_SHA256="9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e"
PREFIX="/usr"
DESTDIR="/"

all: GNOMEUI.ttf GNOMEUI-Italic.ttf

inter:
	echo "$(INTER_SHA256) $(INTER_FILENAME)" | sha256sum --check --status
	unzip -o $(INTER_FILENAME) InterVariable.ttf InterVariable-Italic.ttf

GNOMEUI.ttf: inter
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/GNOME UI" InterVariable.ttf GNOMEUI.ttf

GNOMEUI-Italic.ttf: inter
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/GNOME UI" InterVariable-Italic.ttf GNOMEUI-Italic.ttf

install: GNOMEUI.ttf GNOMEUI-Italic.ttf
	install -Dm655 -t "$(DESTDIR)/$(PREFIX)/share/fonts/gnome-ui" GNOMEUI*.ttf

clean:
	rm *.ttf

.PHONY: inter

INTER_FILENAME="Inter-4.1.zip"
INTER_SHA256="9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e"
PREFIX="/usr"
DESTDIR="/"

all: AdwaitaSans.ttf AdwaitaSans-Italic.ttf

inter:
	echo "$(INTER_SHA256) $(INTER_FILENAME)" | sha256sum --check --status
	unzip -o $(INTER_FILENAME) InterVariable.ttf InterVariable-Italic.ttf

AdwaitaSans.ttf: inter
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable.ttf AdwaitaSans.ttf

AdwaitaSans-Italic.ttf: inter
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable-Italic.ttf AdwaitaSans-Italic.ttf

install: AdwaitaSans.ttf AdwaitaSans-Italic.ttf
	install -Dm655 -t "$(DESTDIR)/$(PREFIX)/share/fonts/adwaita" AdwaitaSans*.ttf

clean:
	rm *.ttf

.PHONY: inter

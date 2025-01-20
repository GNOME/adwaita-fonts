ARCHIVE="Inter-4.1.zip"
HASH="9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e"

FILES=AdwaitaSans-Regular.ttf \
	AdwaitaSans-Italic.ttf

all: $(FILES)

sans:
	echo "$(HASH) $(ARCHIVE)" | sha256sum --check --status
	unzip -o $(ARCHIVE) InterVariable.ttf InterVariable-Italic.ttf

AdwaitaSans-Regular.ttf: sans
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable.ttf $@

AdwaitaSans-Italic.ttf: sans
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable-Italic.ttf $@

install:
	install -Dm655 -t "$(DESTDIR)/$(PREFIX)/share/fonts/Adwaita" $(FILES)

clean:
	rm -f *.ttf

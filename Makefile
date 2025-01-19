PREFIX="/usr"
DESTDIR="/"
NPM="npm"

SANS_ARCHIVE="Inter-4.1.zip"
SANS_SHA256="9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e"

ADWAITA_SANS_FILENAMES=AdwaitaSans-Regular.ttf \
	AdwaitaSans-Italic.ttf

ADWAITA_MONO_FILENAMES=AdwaitaMono-Regular.ttf \
	AdwaitaMono-Italic.ttf \
	AdwaitaMono-Bold.ttf \
	AdwaitaMono-BoldItalic.ttf

all: sans mono
sans: pre-sans $(ADWAITA_SANS_FILENAMES)
mono: pre-mono $(ADWAITA_MONO_FILENAMES)

pre-sans:
	echo "$(SANS_SHA256) $(SANS_ARCHIVE)" | sha256sum --check --status
	unzip -o $(SANS_ARCHIVE) InterVariable.ttf InterVariable-Italic.ttf

AdwaitaSans-Regular.ttf: pre-sans
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable.ttf $@

AdwaitaSans-Italic.ttf: pre-sans
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable-Italic.ttf $@

pre-mono:
	cp private-build-plans.toml Iosevka
	cd Iosevka && $(NPM) run build -- ttf::AdwaitaMono

AdwaitaMono-Regular.ttf: pre-mono
	mv Iosevka/dist/AdwaitaMono/TTF/$@ $@

AdwaitaMono-Italic.ttf: pre-mono
	mv Iosevka/dist/AdwaitaMono/TTF/$@ $@

AdwaitaMono-Bold.ttf: pre-mono
	mv Iosevka/dist/AdwaitaMono/TTF/$@ $@

AdwaitaMono-BoldItalic.ttf: pre-mono
	mv Iosevka/dist/AdwaitaMono/TTF/$@ $@

install:
	install -Dm655 -t "$(DESTDIR)/$(PREFIX)/share/fonts/Adwaita" $(ADWAITA_SANS_FILENAMES) $(ADWAITA_MONO_FILENAMES)

clean:
	rm -r *.ttf

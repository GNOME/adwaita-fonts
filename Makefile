PREFIX="/usr"
DESTDIR="/"

SANS_ARCHIVE="Inter-4.1.zip"
SANS_SHA256="9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e"

MONO_ARCHIVE="v32.4.0.zip"
MONO_SHA256="28485e903808e457cea18385e902402c483978f5fc1ff49035b7cef6b315c11f"

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
	echo "$(MONO_SHA256) $(MONO_ARCHIVE)" | sha256sum --check --status
	unzip $(MONO_ARCHIVE)
	cp private-build-plans.toml Iosevka-32.4.0
	cd Iosevka-32.4.0 && npm install && npm run build -- ttf::AdwaitaMono

AdwaitaMono-Regular.ttf: pre-mono
	mv Iosevka-32.4.0/dist/AdwaitaMono/TTF/$@ $@

AdwaitaMono-Italic.ttf: pre-mono
	mv Iosevka-32.4.0/dist/AdwaitaMono/TTF/$@ $@

AdwaitaMono-Bold.ttf: pre-mono
	mv Iosevka-32.4.0/dist/AdwaitaMono/TTF/$@ $@

AdwaitaMono-BoldItalic.ttf: pre-mono
	mv Iosevka-32.4.0/dist/AdwaitaMono/TTF/$@ $@

install:
	install -Dm655 -t "$(DESTDIR)/$(PREFIX)/share/fonts/Adwaita" $(ADWAITA_SANS_FILENAMES) $(ADWAITA_MONO_FILENAMES)

clean:
	rm -r *.ttf Iosevka-32.4.0

FILES=AdwaitaMono-Regular.ttf \
	AdwaitaMono-Italic.ttf \
	AdwaitaMono-Bold.ttf \
	AdwaitaMono-BoldItalic.ttf

all: $(FILES)

mono:
	cp private-build-plans.toml Iosevka
	cd Iosevka && $(NPM) run build -- ttf::AdwaitaMono

AdwaitaMono-Regular.ttf: mono
	mv Iosevka/dist/AdwaitaMono/TTF/$@ $@

AdwaitaMono-Italic.ttf: mono
	mv Iosevka/dist/AdwaitaMono/TTF/$@ $@

AdwaitaMono-Bold.ttf: mono
	mv Iosevka/dist/AdwaitaMono/TTF/$@ $@

AdwaitaMono-BoldItalic.ttf: mono
	mv Iosevka/dist/AdwaitaMono/TTF/$@ $@

install:
	install -Dm655 -t "$(DESTDIR)/$(PREFIX)/share/fonts/Adwaita" $(FILES)

clean:
	rm -rf *.ttf Iosevka/.build Iosevka/private-build-plans.toml Iosevka/dist

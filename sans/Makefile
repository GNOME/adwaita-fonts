FILES=AdwaitaSans-Regular.ttf \
	AdwaitaSans-Italic.ttf

all: $(FILES)

AdwaitaSans-Regular.ttf:
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable.ttf $@

AdwaitaSans-Italic.ttf:
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/Adwaita Sans" InterVariable-Italic.ttf $@

install:
	install -Dm655 -t "$(DESTDIR)/$(PREFIX)/share/fonts/Adwaita" $(FILES)

clean:
	rm -f *.ttf

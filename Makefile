INTER_FILENAME="Inter-4.0.zip"
INTER_SHA256="ff970a5d4561a04f102a7cb781adbd6ac4e9b6c460914c7a101f15acb7f7d1a4"

all: GNOMEUI.ttf GNOMEUI-Italic.ttf

inter:
	echo "$(INTER_SHA256) $(INTER_FILENAME)" | sha256sum --check --status
	unzip -o $(INTER_FILENAME) InterVariable.ttf InterVariable-Italic.ttf

GNOMEUI.ttf: inter
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/GNOME UI" InterVariable.ttf GNOMEUI.ttf

GNOMEUI-Italic.ttf: inter
	pyftfeatfreeze --features "cv05" --replacenames "Inter Variable/GNOME UI" InterVariable-Italic.ttf GNOMEUI-Italic.ttf

clean:
	rm *.ttf

.PHONY: inter

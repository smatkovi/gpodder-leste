# gPodder for Maemo Leste: gPodder 4 core with the touch QML UI.
# Needs the submodules: git submodule update --init --recursive
PREFIX ?= /usr
SAILFISH = upstream/gpodder-sailfish
UIQML = upstream/gpodder-ui-qml
APP = $(DESTDIR)$(PREFIX)/share/gpodder-leste

all:

install:
	install -d $(APP)/lib $(APP)/touch
	cp -r $(UIQML)/touch/. $(APP)/touch/
	rm -rf $(APP)/touch/common
	cp -r $(SAILFISH)/common $(APP)/touch/common
	rm -f $(APP)/touch/common/main.py $(APP)/touch/common/README.md
	install -m 644 $(SAILFISH)/common/main.py $(APP)/main.py
	cp -r $(SAILFISH)/gpodder-core/src/gpodder $(APP)/lib/
	install -m 644 $(SAILFISH)/minidb/minidb.py $(SAILFISH)/podcastparser/podcastparser.py $(APP)/lib/
	# the UI asks for its fonts by name ("Iconic" for the symbols)
	install -d $(DESTDIR)$(PREFIX)/share/fonts/truetype/gpodder-leste
	install -m 644 $(UIQML)/touch/icons/iconic_fill.ttf $(UIQML)/touch/fonts/*.ttf \
		$(DESTDIR)$(PREFIX)/share/fonts/truetype/gpodder-leste/
	sed 's|@APP@|$(PREFIX)/share/gpodder-leste|' gpodder-leste.in > gpodder-leste
	install -D -m 755 gpodder-leste $(DESTDIR)$(PREFIX)/bin/gpodder-leste
	install -D -m 644 gpodder-leste.desktop $(DESTDIR)$(PREFIX)/share/applications/hildon/gpodder-leste.desktop
	for s in 86 108 128 256; do \
		install -D -m 644 $(SAILFISH)/icons/$${s}x$${s}/apps/harbour-org.gpodder.sailfish.png \
			$(DESTDIR)$(PREFIX)/share/icons/hicolor/$${s}x$${s}/apps/gpodder-leste.png; \
	done
	find $(APP) -name '*.pyc' -delete
	find $(APP) -name __pycache__ -type d -empty -delete

clean:
	rm -f gpodder-leste

.PHONY: all install clean

# gPodder for Maemo Leste

The podcast client of Maemo 5, brought up to date for
[Maemo Leste](https://maemo-leste.github.io/): the current gPodder 4 core
with the touch QML UI, on PyOtherSide and Qt 5.

- gpodder-core 4.17.2, podcastparser and minidb, with the Python bridge and
  QML models of [gPodder for Sailfish OS](https://github.com/gpodder/gpodder-sailfish)
  4.18.1 (the maintained mobile line);
- the touch UI of [gpodder-ui-qml](https://github.com/gpodder/gpodder-ui-qml),
  the gPodder 4 QML reference UI for phones.

Maemo 5's gPodder 2.x had a PyGTK/Hildon UI on Python 2; Leste (Debian 12)
has neither, and GTK 2/Hildon have no Python 3 bindings, so this is the
way to a current gPodder on Leste.

## Install

Download the `.deb` from the [releases](https://github.com/smatkovi/gpodder-leste/releases)
and install it with `apt install ./gpodder-leste_*_all.deb` (pulls in
PyOtherSide and the Qt Quick modules). It appears in the application menu
as gPodder; `gpodder-leste` starts it. Settings and downloads live in
`~/.config/gpodder`, `~/.local/share/gpodder` and `~/.cache/gpodder`.

## Build

    git clone --recursive https://github.com/smatkovi/gpodder-leste
    cd gpodder-leste && dpkg-buildpackage -b -us -uc

The upstream projects are git submodules pinned to tested commits
(`upstream/`).

Tested on the F(x)tec Pro1X with Maemo Leste (arm64).

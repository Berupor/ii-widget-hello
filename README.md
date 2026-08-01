# Hello widget

The smallest widget for the [illogical-impulse extensions
fork](https://github.com/Berupor/dots-hyprland) that is still a real one: a bar
indicator with an option, a sibling type and its own singleton. Copy this repo to
start your own.

| In the bar | Both states |
|---|---|
| ![Bar indicator](docs/bar.png) | ![States](docs/states.png) |

## What a widget is

A directory with a `Manifest.qml`, cloned into
`~/.config/illogical-impulse/widgets/<id>/`. The catalog scans that folder on
start, so no file of the shell needs editing.

| File | What it is there for |
|---|---|
| `Manifest.qml` | id, name, icon, versions, slots, options |
| `HelloIndicator.qml` | the view a slot points at |
| `HelloBadge.qml` | a sibling type, resolves with no import at all |
| `HelloState.qml` + `qmldir` | a singleton, which needs its `qmldir` line or its properties silently read as empty |
| `demo/` | scenes: the tests and the pictures, never loaded by the shell |
| `shots.txt` | what `widget-shots.sh` photographs for the README |

## The contract

- **Slots** are where the shell hangs your views: `barIndicator`,
  `barUtilButton`, `sidebarLeftTab`, `sidebarRightTab`, `backgroundWidget`,
  `regionAction`, and `catalogView` / `settingsView` for taking a settings screen
  over. Paths are relative to the widget directory.
- **Options** are a schema in the manifest, with defaults. The settings page
  draws them for you; read them back with `WidgetCatalog.option(id, key)`. A
  `settingsPage` is only needed when the generated form is not enough.
- **Dependencies** are binaries in `dependencies`. A widget missing one says so
  in the catalog instead of turning into a dead button.
- **Versions**: bump `version` on every release, and keep `minShellVersion` at
  the contract you built against. The shell refuses a widget from the future.
- **Design system only**: `Appearance.*` for colors and fonts, `MaterialSymbol`,
  the widgets in `modules/common/widgets/`. Colors are generated from the
  wallpaper, so a hardcoded `#rrggbb` sticks out on everyone else's desktop.
  `design-lint.sh` fails the build over it.

The whole contract is written down in the shell's
`modules/widgets/WidgetManifest.qml`.

## Working on it

Clone into the widgets folder, enable it in Settings → Widgets, and let the
fork's toolkit do the rest. It renders your widget in a throwaway shell instance,
so nothing touches the session you are working in:

```sh
tests/widget-probe.sh hello barIndicator -x ~/.config/illogical-impulse/widgets/hello
tests/qml-cases.sh    -x ~/.config/illogical-impulse/widgets/hello
tests/widget-shots.sh -x ~/.config/illogical-impulse/widgets/hello
```

`git config core.hooksPath .githooks` runs the cases and redraws the shots on
push, so the README never shows a widget you no longer have.

## Install

Settings → Widgets → Install a widget, paste:

```
https://github.com/Berupor/ii-widget-hello.git
```

GPL-3.0, same as the shell it plugs into.

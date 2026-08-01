//@ probe hello -g 260x140
import ".." // The widget's own types and its HelloState singleton, via its qmldir
import QtQuick.Layouts

/**
 * Every state of the indicator in one picture. A scene is a plain QML file that
 * builds your views with the state you want drawn, and its `checks` are the tests:
 * `qml-cases.sh -x .` asserts them, `widget-shots.sh -x .` photographs them.
 */
RowLayout {
    spacing: 16

    ColumnLayout {
        spacing: 0

        HelloIndicator {
            id: plain
            badge: false
        }

        HelloIndicator {
            id: badged
            badge: true
        }
    }

    // What the vertical bar loads: the same file, with `vertical` set on it
    HelloIndicator {
        id: upright
        badge: true
        vertical: true
    }

    function checks() {
        return [
            {
                "name": "the singleton resolves through qmldir",
                "got": plain.greeting,
                "want": "Hello"
            },
            {
                "name": "the badge takes room in the bar",
                "got": badged.implicitWidth > plain.implicitWidth,
                "want": true
            },
            {
                "name": "the vertical one stacks instead of stretching",
                "got": upright.implicitHeight > upright.implicitWidth,
                "want": true
            },
            {
                "name": "the vertical one keeps to the bar width",
                "got": upright.implicitWidth < badged.implicitWidth,
                "want": true
            }
        ];
    }
}

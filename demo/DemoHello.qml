//@ probe hello -g 165x82
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
            id: greeted
            showGreeting: true
        }

        HelloIndicator {
            id: quiet
            showGreeting: false
        }
    }

    // What the vertical bar loads: the same file, with `vertical` set on it
    HelloIndicator {
        id: upright
        showGreeting: true
        vertical: true
    }

    // Not in the picture, only in the check below
    HelloIndicator {
        id: uprightQuiet
        visible: false
        showGreeting: false
        vertical: true
    }

    function checks() {
        return [
            {
                "name": "the singleton resolves through qmldir",
                "got": greeted.greeting,
                "want": "Hello"
            },
            {
                "name": "the greeting takes room in the bar",
                "got": greeted.implicitWidth > quiet.implicitWidth,
                "want": true
            },
            {
                // Horizontally the greeting buys width, vertically it buys height
                "name": "the vertical one stacks the greeting under the icon",
                "got": upright.implicitHeight > uprightQuiet.implicitHeight,
                "want": true
            },
            {
                "name": "the vertical one keeps to the bar width",
                "got": upright.implicitWidth < greeted.implicitWidth,
                "want": true
            }
        ];
    }
}

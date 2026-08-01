//@ probe hello -g 200x88
import ".." // The widget's own types and its HelloState singleton, via its qmldir
import QtQuick.Layouts

/**
 * Every state of the indicator in one picture. A scene is a plain QML file that
 * builds your views with the state you want drawn, and its `checks` are the tests:
 * `qml-cases.sh -x .` asserts them, `widget-shots.sh -x .` photographs them.
 */
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
            }
        ];
    }
}

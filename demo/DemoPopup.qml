//@ probe -g 200x80
/**
 * The popup body on a made-up uptime, so the picture is the same on every machine
 * and `uptime` is never run. The widget is not named in `//@ probe` on purpose:
 * enabled, its own poll would overwrite what the scene sets here.
 */
import ".." // The widget's own types and its HelloState singleton, via its qmldir
import QtQuick

Item {
    id: root

    HelloDetails {
        id: details
        anchors.centerIn: parent
        uptime: "3 hours, 20 minutes"
    }

    // A view with nothing to show yet must still draw as something
    HelloDetails {
        id: empty
        visible: false
        uptime: ""
    }

    function checks() {
        return [
            {
                "name": "the body sizes to its rows",
                "got": details.implicitHeight > 0 && details.implicitWidth > 0,
                "want": true
            },
            {
                "name": "an empty uptime still takes room",
                "got": empty.implicitWidth > 0,
                "want": true
            }
        ];
    }
}

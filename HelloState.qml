pragma Singleton

/** Singleton of an external widget: only resolves because qmldir declares it. */

// What a widget shows rarely comes from QML, so this one runs `uptime -p` on a
// timer. Two rules the catalog cares about: the binary is in `dependencies`, and
// nothing polls while the widget is off - disabled still means loaded.

import qs.modules.widgets
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property string greeting: "Hello"
    /// Empty until the first run comes back, which the views draw as a dash
    property string uptime: ""

    readonly property bool enabled: WidgetCatalog.isEnabled("hello")
    readonly property int pollSeconds: WidgetCatalog.option("hello", "pollSeconds") ?? 60

    Timer {
        interval: Math.max(5, root.pollSeconds) * 1000
        repeat: true
        triggeredOnStart: true
        running: root.enabled
        onTriggered: if (!uptimeProc.running) uptimeProc.running = true
    }

    Process {
        id: uptimeProc
        command: ["uptime", "-p"]
        stdout: StdioCollector {
            id: collector
            onStreamFinished: root.uptime = collector.text.trim().replace(/^up /, "")
        }
    }
}

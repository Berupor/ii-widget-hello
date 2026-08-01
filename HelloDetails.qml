import qs.modules.ii.bar
import qs.services
import QtQuick
import QtQuick.Layouts

/** Popup body, a file of its own: a window cannot be grabbed, an Item can. */
Item {
    id: root

    /// From the singleton, unless a demo scene hands the view a made-up one
    property string uptime: HelloState.uptime

    implicitWidth: column.implicitWidth
    implicitHeight: column.implicitHeight

    ColumnLayout {
        id: column
        anchors.centerIn: parent
        spacing: 8

        StyledPopupHeaderRow {
            icon: "waving_hand"
            label: Translation.tr("Hello")
        }

        StyledPopupValueRow {
            Layout.fillWidth: true
            icon: "schedule"
            label: Translation.tr("Up:")
            value: root.uptime !== "" ? root.uptime : "-"
        }
    }
}

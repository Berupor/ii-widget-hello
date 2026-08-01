// Popup frame, body in HelloDetails.qml. StyledPopup is a LazyLoader over a
// PanelWindow and only lives while the bar item is hovered, so the ten lines here
// are all a widget needs to hang one off its indicator.

import qs.modules.ii.bar
import QtQuick

StyledPopup {
    id: root

    property string uptime: HelloState.uptime

    HelloDetails {
        anchors.centerIn: parent
        uptime: root.uptime
    }
}

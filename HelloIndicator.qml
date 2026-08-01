import qs.modules.common
import qs.modules.common.widgets
import qs.modules.widgets
import QtQuick
import QtQuick.Layouts

/** Bar indicator: design system, sibling type, own singleton, one option. */
Item {
    id: root

    // Options default from the catalog but stay writable, so a demo scene can
    // draw every state without touching the store
    property bool badge: WidgetCatalog.option("hello", "badge") ?? false
    readonly property string greeting: HelloState.greeting

    implicitWidth: row.implicitWidth
    implicitHeight: Appearance.sizes.barHeight

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 4

        MaterialSymbol {
            text: "waving_hand"
            iconSize: Appearance.font.pixelSize.larger
            color: Appearance.colors.colOnLayer1
        }

        StyledText {
            text: root.greeting
            color: Appearance.colors.colOnLayer1
        }

        HelloBadge {
            visible: root.badge
        }
    }
}

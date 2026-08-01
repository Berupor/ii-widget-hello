import qs.modules.common
import qs.modules.common.widgets
import qs.modules.widgets
import QtQuick
import QtQuick.Layouts

/** Bar indicator: both orientations, a popup on hover, own singleton, two options. */
MouseArea {
    id: root

    // Options default from the catalog but stay writable, so a demo scene can
    // draw every state without touching the store
    property bool showGreeting: WidgetCatalog.option("hello", "showGreeting") ?? false
    // Set by the vertical bar on load, so one file covers both orientations
    property bool vertical: false
    readonly property string greeting: HelloState.greeting
    readonly property real barThickness: root.vertical ? Appearance.sizes.verticalBarWidth : Appearance.sizes.barHeight

    implicitWidth: root.vertical ? root.barThickness : layout.implicitWidth
    implicitHeight: root.vertical ? layout.implicitHeight : root.barThickness
    // The popup follows the hover, and the bar has a setting for opening those by click
    hoverEnabled: !Config.options.bar.tooltips.clickToShow

    GridLayout {
        id: layout
        anchors.centerIn: parent
        columns: root.vertical ? 1 : -1 // One column stacks, -1 keeps a row
        columnSpacing: 4
        rowSpacing: 2

        MaterialSymbol {
            Layout.alignment: Qt.AlignHCenter
            text: "waving_hand"
            iconSize: Appearance.font.pixelSize.larger
            color: Appearance.colors.colOnLayer1
        }

        StyledText {
            Layout.alignment: Qt.AlignHCenter
            // 46px of bar leaves no room for a word, so it elides and drops a step
            Layout.maximumWidth: root.vertical ? root.barThickness - 8 : -1
            visible: root.showGreeting
            elide: Text.ElideRight
            text: root.greeting
            font.pixelSize: root.vertical ? Appearance.font.pixelSize.smaller : Appearance.font.pixelSize.normal
            color: Appearance.colors.colOnLayer1
        }
    }

    HelloPopup {
        hoverTarget: root
    }
}

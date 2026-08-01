import qs.modules.common
import qs.modules.common.widgets
import QtQuick

/** Sibling type of an external widget: resolves without any import. */
Rectangle {
    id: root

    // The ink of a digit sits off-centre inside its advance box, so centring the
    // text item leaves the glyph visibly to one side. Centre the tight rectangle
    // the font reports for the glyph itself.
    readonly property rect ink: metrics.tightBoundingRect
    readonly property real diameter: Math.max(label.implicitWidth, label.implicitHeight) + 6

    implicitWidth: diameter
    implicitHeight: diameter
    radius: height / 2
    color: Appearance.colors.colSecondaryContainer
    antialiasing: true

    TextMetrics {
        id: metrics
        font: label.font
        text: label.text
    }

    StyledText {
        id: label
        text: "8"
        font.pixelSize: Appearance.font.pixelSize.smaller
        color: Appearance.colors.colOnSecondaryContainer
        x: Math.round((root.width - root.ink.width) / 2 - root.ink.x)
        y: Math.round((root.height - root.ink.height) / 2 - root.ink.y - label.baselineOffset)
    }
}

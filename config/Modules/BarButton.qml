import QtQuick
import QtQuick.Layouts
import qs.Settings
import qs.Modules

StyledButton {
    id: root
    property bool padding: true
    implicitHeight: Math.max(Theme.widgets.minimumHeight, layout.height + (padding ? 5 : 0))
    implicitWidth: layout.width + (padding ? 12 : 8)
    //visible: layout.visible

    Behavior on color {
        ColorAnimation {
            duration: 100
        }
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 100
        }
    }
}

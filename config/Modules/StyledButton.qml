import QtQuick
import qs.Modules
import qs.Settings

StyledRectangle {
    property alias mouse: mouse
    property bool selected: false

    border.width: 0

    color: {
        if (selected)
            return Theme.colors.button.selected;
        if (mouse.pressed)
            return Theme.colors.button.pressed;
        if (mouse.containsMouse)
            return Theme.colors.button.hover;
        return Theme.colors.button.normal;
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
    }
}

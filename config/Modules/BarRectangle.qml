import QtQuick
import qs.Settings

Rectangle {
    color: Theme.widgetBackground
    implicitHeight: layout.height + 4
    implicitWidth: layout.width + 10
    radius: Theme.cornerRadius

    Item {
        id: layout
        anchors.centerIn: parent
        width: childrenRect.width
        height: childrenRect.height
    }

    default property alias content: layout.children
}

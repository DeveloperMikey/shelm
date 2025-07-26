import QtQuick
import qs.Settings

Rectangle {
    id: root
    color: Theme.widgetBackground
    implicitHeight: layout.childrenRect.height + 4
    implicitWidth: layout.childrenRect.width + 10
    radius: Theme.cornerRadius
    visible: layout.visible

    Item {
        id: layout
        anchors.centerIn: parent
    }

    default property alias content: layout.children
}

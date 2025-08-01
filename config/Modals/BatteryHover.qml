import QtQuick
import Quickshell
import qs.Settings
import qs.Services
import qs.Modules

Popup {
    id: root

    property int seconds: BatteryService.timeRemaining
    property int days: Math.floor(seconds / 86400)
    property int hours: Math.floor((seconds % 86400) / 3600)
    property int minutes: Math.floor((seconds % 3600) / 60)

    function durationString() {
        return (days > 0 ? days + "d " : "") + (hours > 0 ? hours + "h " : "") + (minutes > 0 ? minutes + "m" : "");
    }

    color: "transparent"
    implicitWidth: rect.width
    implicitHeight: rect.height

    Rectangle {
        id: rect
        anchors.centerIn: parent
        color: Theme.widgets.backgroundColor
        radius: Theme.cornerRadius
        width: text.contentWidth + 10
        height: text.contentHeight + 5
        StyledText {
            id: text
            anchors.centerIn: parent
            text: root.durationString()
        }
    }
}

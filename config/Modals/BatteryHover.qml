import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Settings
import qs.Panels
import qs.Services
import qs.Modules

Popup {
    id: root

    property int seconds: BatteryService.timeRemaining
    property int days: Math.floor(seconds / 86400)
    property int hours: Math.floor((seconds % 86400) / 3600)
    property int minutes: Math.floor((seconds % 3600) / 60)
    property string display: (days > 0 ? days + "d" : "") + (hours > 0 ? (days > 0 ? " " : "") + hours + "h" : "") + (minutes > 0 ? (hours > 0 ? " " : "") + minutes + "m" : "")

    RowLayout {
        StyledText {
            id: text
            Layout.margins: 4
            text: root.display
        }
    }
}

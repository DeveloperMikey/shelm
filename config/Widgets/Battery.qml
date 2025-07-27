import QtQuick
import QtQuick.Layouts
import qs.Settings
import qs.Services
import qs.Modules
import Quickshell.Hyprland

Rectangle {
    color: Theme.widgets.battery.backgroundColor
    anchors.centerIn: parent
    radius: Theme.cornerRadius
    implicitHeight: row.height + 4
    implicitWidth: Math.max(row.width + 10, Theme.widgets.battery.minimumSize)

    Rectangle {
        implicitHeight: parent.height
        implicitWidth: parent.width * BatteryService.batteryLevel / 100
        radius: Theme.cornerRadius
        color: {
            BatteryService.batteryLevel <= 30 ? Theme.widgets.battery.criticalColor : Theme.widgets.backgroundColor;
        }
    }

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 1
        Icon {
            text: "electric_bolt"
            Layout.topMargin: 1
            visible: BatteryService.isCharging
        }
        StyledText {
            text: BatteryService.batteryLevel + "%"
        }
    }
}

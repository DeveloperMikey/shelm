import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Widgets
import Quickshell
import qs.Settings
import qs.Services

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
        Text {
            text: "electric_bolt"
            Layout.topMargin: 1
            font.family: Theme.font.family.material
            color: Theme.textPrimary
            visible: BatteryService.isCharging
        }
        Text {
            text: BatteryService.batteryLevel + "%"
            Layout.topMargin: 2
            font.pixelSize: Theme.font.size.normal
            color: Theme.textPrimary
        }
    }
}

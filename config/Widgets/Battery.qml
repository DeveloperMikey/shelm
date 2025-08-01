pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import qs.Settings
import qs.Services
import qs.Modules
import qs.Modals
import Quickshell.Services.UPower

Loader {
    id: root
    required property var bar
    active: BatteryService.batteryAvailable

    sourceComponent: Rectangle {
        id: battery
        color: Theme.widgets.battery.backgroundColor
        anchors.centerIn: parent
        radius: Theme.cornerRadius
        implicitHeight: row.height + 4
        implicitWidth: Math.max(row.width + 10, Theme.widgets.battery.minimumSize)

        border.width: 1
        border.color: mouse.containsMouse ? Theme.widgets.hoverBorderColor : Theme.widgets.borderColor

        Behavior on border.color {
            ColorAnimation {
                duration: 90
            }
        }

        Rectangle {
            implicitHeight: parent.height - 2
            implicitWidth: (parent.width * BatteryService.batteryLevel / 100) - 1
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 1
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
                text: "south"
                Layout.topMargin: 1
                visible: UPower.onBattery
            }
            Icon {
                text: "power"
                Layout.topMargin: 1
                visible: !BatteryService.isCharging && !UPower.onBattery
            }
            Icon {
                text: "electric_bolt"
                Layout.topMargin: 1
                visible: BatteryService.isCharging
            }
            StyledText {
                text: BatteryService.batteryLevel + "%"
            }
        }

        BatteryHover {
            visible: mouse.containsMouse && (BatteryService.isCharging || UPower.onBattery) && !menu.visible
            anchor.item: battery
        }

        BatteryMenu {
            id: menu
            open: false
            anchor.item: battery
        }

        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true
            onPressed: menu.open = !menu.open
        }
    }
}

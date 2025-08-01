import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import qs.Settings
import qs.Modules

ColumnLayout {
    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Repeater {
            model: [
                {
                    profile: PowerProfile.PowerSaver,
                    icon: "energy_savings_leaf"
                },
                {
                    profile: PowerProfile.Balanced,
                    icon: "balance"
                },
                {
                    profile: PowerProfile.Performance,
                    icon: "rocket_launch"
                },
            ]
            delegate: Rectangle {
                id: holder
                required property var modelData
                Layout.fillWidth: true
                Layout.preferredHeight: 30
                radius: Theme.cornerRadius
                color: PowerProfiles.profile === modelData.profile ? "#665c54" : Theme.widgets.backgroundColor
                border.width: 1
                border.color: mouse.containsMouse ? Theme.widgets.hoverBorderColor : Theme.widgets.borderColor
                Icon {
                    text: holder.modelData.icon
                    font.pixelSize: Theme.font.size.large
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Behavior on color {
                    ColorAnimation {
                        duration: 100
                    }
                }

                MouseArea {
                    id: mouse
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: PowerProfiles.profile = holder.modelData.profile
                }
            }
        }
    }
}

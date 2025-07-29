pragma ComponentBehavior: Bound
import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Services
import qs.Widgets
import qs.Settings

Scope {
    id: root
    Component {
        id: clockComponent
        Clock {}
    }

    Component {
        id: batteryComponent
        Loader {
            active: BatteryService.batteryAvailable
            sourceComponent: Battery {}
        }
    }

    Component {
        id: dashboardComponent
        Dashboard {}
    }

    Component {
        id: bluetoothComponent
        Bluetooth {}
    }

    function getWidgetComponent(name) {
        switch (name) {
        case "Clock":
            return clockComponent;
        case "Battery":
            return batteryComponent;
        case "Bluetooth":
            return bluetoothComponent;
        case "Dashboard":
            return dashboardComponent;
        default:
            return null;
        }
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData
            screen: modelData
            color: Theme.backgroundPrimary

            implicitHeight: Theme.barHeight + (Theme.barSeperator ? 2 : 0)
            Component.onCompleted: console.log(modelData)

            anchors {
                top: true
                left: true
                right: true
            }

            Item {
                anchors.left: parent.left
                anchors.leftMargin: 5
                height: Theme.barHeight
                width: leftRow.width
                RowLayout {
                    id: leftRow
                    anchors.verticalCenter: parent.verticalCenter
                    Repeater {
                        model: Settings.barLeftWidgets
                        delegate: Loader {
                            required property string modelData
                            sourceComponent: root.getWidgetComponent(modelData)
                        }
                    }
                }
            }

            Item {
                anchors.horizontalCenter: parent.horizontalCenter
                height: Theme.barHeight
                width: middleRow.width
                RowLayout {
                    id: middleRow
                    anchors.verticalCenter: parent.verticalCenter
                    Repeater {
                        model: Settings.barMiddleWidgets
                        delegate: Loader {
                            required property string modelData
                            sourceComponent: root.getWidgetComponent(modelData)
                        }
                    }
                }
            }

            Item {
                anchors.right: parent.right
                anchors.rightMargin: 5
                height: Theme.barHeight
                width: rightRow.width
                RowLayout {
                    id: rightRow
                    anchors.verticalCenter: parent.verticalCenter
                    layoutDirection: Qt.RightToLeft
                    Repeater {
                        model: Settings.barRightWidgets
                        delegate: Loader {
                            required property string modelData
                            sourceComponent: root.getWidgetComponent(modelData)
                        }
                    }
                }
            }

            Loader {
                active: Theme.barSeperator
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                sourceComponent: Rectangle {
                    id: seperator
                    implicitHeight: 2
                    color: Theme.seperatorColor
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                }
            }
        }
    }
}

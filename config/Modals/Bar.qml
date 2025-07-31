pragma ComponentBehavior: Bound
import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Settings
import qs.Modules

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData
            screen: modelData
            color: Theme.backgroundPrimary

            implicitHeight: Theme.barHeight + (Theme.barSeperator ? 2 : 0)

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
                BarWidgetRow {
                    id: leftRow
                    widgets: Settings.barLeftWidgets
                    barRef: bar
                }
            }

            Item {
                anchors.horizontalCenter: parent.horizontalCenter
                height: Theme.barHeight
                width: middleRow.width
                BarWidgetRow {
                    id: middleRow
                    widgets: Settings.barMiddleWidgets
                    barRef: bar
                }
            }

            Item {
                anchors.right: parent.right
                anchors.rightMargin: 5
                height: Theme.barHeight
                width: rightRow.width
                BarWidgetRow {
                    id: rightRow
                    widgets: Settings.barRightWidgets
                    barRef: bar
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

import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Widgets
import qs.Settings

Scope {
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
                anchors.horizontalCenter: parent.horizontalCenter
                height: Theme.barHeight
                RowLayout {
                    anchors.verticalCenter: parent.verticalCenter
                    Clock {}
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
                    color: Theme.backgroundSecondary
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                }
            }
        }
    }
}

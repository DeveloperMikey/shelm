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

            implicitHeight: Theme.barHeight

            anchors {
                top: true
                left: true
                right: true
            }

            RowLayout {
                anchors.centerIn: parent
                Clock {}
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

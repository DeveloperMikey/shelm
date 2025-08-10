pragma ComponentBehavior: Bound
import QtQuick.Layouts
import QtQuick
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import qs.Modules
import qs.Modals
import qs.Settings

BarRectangle {
    id: rect
    required property var bar

    visible: items.count > 0
    RowLayout {
        property var systemTray: SystemTray
        spacing: 3
        Repeater {
            id: items
            model: SystemTray.items
            delegate: Item {
                id: item
                required property var modelData
                width: Theme.widgets.minimumHeight - 4
                height: Theme.widgets.minimumHeight - 4

                IconImage {
                    id: icon
                    asynchronous: true
                    source: {
                        let icon = item.modelData?.icon || "";
                        if (!icon)
                            return "";
                        // Process icon path
                        if (icon.includes("?path=")) {
                            const [name, path] = icon.split("?path=");
                            const fileName = name.substring(name.lastIndexOf("/") + 1);
                            return `file://${path}/${fileName}`;
                        }
                        return icon;
                    }
                    width: Theme.widgets.minimumHeight - 2
                    height: Theme.widgets.minimumHeight - 2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    MouseArea {
                        id: mouse
                        anchors.fill: parent
                        hoverEnabled: true
                        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                        anchors.verticalCenterOffset: 2

                        onClicked: mouse => {
                            if (mouse.button === Qt.LeftButton) {
                                if (!item.modelData.onlyMenu) {
                                    item.modelData.activate();
                                } else {
                                    popup.open = true;
                                }
                            } else if (mouse.button === Qt.MiddleButton) {
                                item.modelData.secondaryActivate && item.modelData.secondaryActivate();
                            } else if (mouse.button === Qt.RightButton) {
                                popup.open = true;
                            }
                        }
                    }

                    TrayTooltip {
                        id: tooltip
                        open: mouse.containsMouse
                        anchor.item: item
                        anchor.margins.top: Theme.barHeight
                        title: item.modelData.tooltipTitle || item.modelData.title
                        description: item.modelData.tooltipDescription
                    }

                    TrayPopup {
                        id: popup
                        open: false
                        anchor.item: item
                        anchor.margins.top: Theme.barHeight
                        menu: item.modelData.menu
                        //anchor.margins.left: item.x + (icon.width / 2) - (width / 2)
                    }

                    Behavior on width {
                        NumberAnimation {
                            duration: 50
                        }
                    }
                    Behavior on height {
                        NumberAnimation {
                            duration: 50
                        }
                    }
                }
            }
        }
    }
}

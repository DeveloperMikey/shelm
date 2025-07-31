import QtQuick.Layouts
import QtQuick
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import qs.Modules
import qs.Settings

BarRectangle {
    visible: items.count > 0
    RowLayout {
        property var systemTray: SystemTray
        spacing: 3
        Repeater {
            id: items
            model: SystemTray.items
            delegate: Item {
                width: icon.width
                height: icon.height
                IconImage {
                    id: icon
                    asynchronous: true
                    source: {
                        let icon = modelData?.icon || "";
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
                    y: mouse.containsMouse ? -1 : 1
                    width: Theme.widgets.minimumHeight - 4
                    height: Theme.widgets.minimumHeight - 4
                    MouseArea {
                        id: mouse
                        anchors.fill: parent
                        hoverEnabled: true
                        anchors.verticalCenterOffset: 2
                    }

                    Behavior on y {
                        NumberAnimation {
                            duration: 100
                        }
                    }
                }
            }
        }
    }
}

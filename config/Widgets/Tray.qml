import QtQuick.Layouts
import QtQuick
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import qs.Modules
import qs.Settings

BarRectangle {
    RowLayout {
        property var systemTray: SystemTray
        spacing: 3
        anchors.fill: parent
        Repeater {
            model: SystemTray.items
            delegate: IconImage {
                id: icon
                asynchronous: true
                anchors.verticalCenter: parent.verticalCenter
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
                width: Theme.widgets.minimumHeight - 4
                height: Theme.widgets.minimumHeight - 4
                Component.onCompleted: console.log(modelData)
            }
        }
    }
}

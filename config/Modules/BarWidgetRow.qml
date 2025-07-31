pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import qs.Widgets
import qs.Services

RowLayout {
    id: root
    Component {
        id: clockComponent
        Clock {}
    }

    Component {
        id: batteryComponent
        Battery {}
    }

    Component {
        id: dashboardComponent
        Dashboard {}
    }

    Component {
        id: bluetoothComponent
        Bluetooth {}
    }

    Component {
        id: networkComponent
        Network {}
    }

    Component {
        id: trayComponent
        Tray {}
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
        case "Network":
            return networkComponent;
        case "Tray":
            return trayComponent;
        default:
            return null;
        }
    }
    required property var widgets
    required property var barRef
    anchors.verticalCenter: parent.verticalCenter
    layoutDirection: Qt.RightToLeft
    /*
    Repeater {
        model: root.widgets
        delegate: Loader {
            required property string modelData
            sourceComponent: getWidgetComponent()
        }
    }
    */
    Component.onCompleted: {
        root.widgets.forEach(widget => {
            const comp = root.getWidgetComponent(widget);
            const obj = comp.createObject(root, {
                bar: barRef
            });
        });
    }
}

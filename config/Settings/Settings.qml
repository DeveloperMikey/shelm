pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    readonly property string shellName: "shelm"
    readonly property string settingsDir: (Quickshell.env("SHELM_CONFIG") || Quickshell.env("XDG_CONFIG_HOME") || Quickshell.env("HOME") + "/.config") + "/" + shellName + "/"
    readonly property string settingsFile: settingsDir + "Settings.json"

    property alias use12HourClock: adapter.use12HourClock

    property alias barLeftWidgets: adapter.barLeftWidgets
    property alias barMiddleWidgets: adapter.barMiddleWidgets
    property alias barRightWidgets: adapter.barRightWidgets

    FileView {
        id: settingFileView
        path: root.settingsFile
        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: adapter
            property bool use12HourClock: false

            property var barLeftWidgets: []
            property var barMiddleWidgets: ["Clock"]
            property var barRightWidgets: ["Battery", "Clock"]
        }
    }
}

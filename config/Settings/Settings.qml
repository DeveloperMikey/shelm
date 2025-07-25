pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string shellName: "shelm"
    property string settingsDir: (Quickshell.env("SHELM_CONFIG") || Quickshell.env("XDG_CONFIG_HOME") || Quickshell.env("HOME") + "/.config") + "/" + shellName + "/"
    property string settingsFile: settingsDir + "Settings.json"

    property alias use12HourClock: adapter.use12HourClock

    FileView {
        id: settingFileView
        path: root.settingsFile
        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: adapter
            property bool use12HourClock: false
        }
    }
}

pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Io
import qs.Settings

Singleton {
    id: root
    property string themeFile: Settings.settingsDir + "Theme.json"

    property alias backgroundPrimary: adapter.backgroundPrimary

    property alias textPrimary: adapter.textPrimary

    FileView {
        id: settingFileView
        path: root.themeFile
        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: adapter
            property string backgroundPrimary: "#282828"

            property string textPrimary: "#fbf1c7"
        }
    }
}

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
    property alias backgroundSecondary: adapter.backgroundSecondary

    property alias textPrimary: adapter.textPrimary
    property alias textSecondary: adapter.textSecondary

    property alias cornerRadius: adapter.cornerRadius
    property alias contentSpacing: adapter.contentSpacing

    property alias barHeight: adapter.barHeight
    property alias barSeperator: adapter.barSeperator

    property alias showDayOnBar: adapter.showDayOnBar
    property alias showDayOfMonthOnBar: adapter.showDayOfMonthOnBar

    FileView {
        id: settingFileView
        path: root.themeFile
        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: adapter
            property string backgroundPrimary: "#282828"
            property string backgroundSecondary: "#d65d0e"

            property string textPrimary: "#fbf1c7"
            property string textSecondary: "#a89984"

            property int cornerRadius: 9
            property int contentSpacing: 2

            property int barHeight: 30
            property bool barSeperator: true

            property bool showDayOnBar: true
            property bool showDayOfMonthOnBar: true
        }
    }
}

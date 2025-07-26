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
    property alias textSecondary: adapter.textSecondary

    property alias font: adapter.font
    property alias widgets: adapter.widgets

    property alias cornerRadius: adapter.cornerRadius
    property alias contentSpacing: adapter.contentSpacing

    property alias barHeight: adapter.barHeight
    property alias barSeperator: adapter.barSeperator
    property alias seperatorColor: adapter.seperatorColor

    property alias widgetBackground: adapter.widgetBackground

    property alias showDayOnBar: adapter.showDayOnBar
    property alias showDayOfMonthOnBar: adapter.showDayOfMonthOnBar

    component FontFamily: QtObject {
        property string sans: "IBM Plex Sans"
        property string mono: "JetBrains Mono NF"
        property string material: "Material Symbols Rounded"
    }

    component FontSize: QtObject {
        property int small: 11
        property int smaller: 12
        property int normal: 13
        property int larger: 15
        property int large: 18
        property int extraLarge: 28
    }

    component FontStuff: QtObject {
        property FontFamily family: FontFamily {}
        property FontSize size: FontSize {}
    }

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
            property string textSecondary: "#a89984"

            property FontStuff font: FontStuff {}
            property Widgets.Widgets widgets: Widgets.Widgets {}

            property int cornerRadius: 9
            property int contentSpacing: 2

            property int barHeight: 30
            property bool barSeperator: true
            property string seperatorColor: "#d65d0e"

            property string widgetBackground: "#504945"

            property bool showDayOnBar: true
            property bool showDayOfMonthOnBar: true
        }
    }
}

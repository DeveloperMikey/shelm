pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Io
import qs.Settings

Singleton {
    id: root

    Item {
        id: item
    }

    property color red: "#c04040"

    component ButtonColors: QtObject {
        required property color normal
        required property color accent
        property color hover: Qt.tint(normal, Qt.alpha(accent, 0.2))
        property color pressed: Qt.tint(normal, Qt.alpha(accent, 0.1))
        property color selected: Qt.tint(normal, Qt.alpha(accent, 0.4))
    }

    component Colors: QtObject {
        id: clrs
        property color base: item.palette.active.base
        property color accent: item.palette.active.accent
        property color text: item.palette.active.text
        property color light: item.palette.active.light
        property color mid: item.palette.active.mid
        property color midlight: item.palette.active.midlight

        property ButtonColors button: ButtonColors {
            normal: clrs.light
            accent: clrs.accent
        }

        property ButtonColors midlightButton: ButtonColors {
            normal: clrs.midlight
            accent: clrs.accent
        }

        property ButtonColors redLight: ButtonColors {
            normal: Qt.tint(clrs.light, Qt.alpha("#c04040", 0.3))
            accent: "#c04040"
        }

        property ButtonColors redMidlight: ButtonColors {
            normal: Qt.tint(clrs.midlight, Qt.alpha("#c04040", 0.2))
            accent: "#c04040"
        }

        property color border: Qt.tint(light, Qt.alpha(base, 0.3))
    }

    property alias colors: adapter.colors

    property string themeFile: Settings.settingsDir + "Theme.json"

    property alias font: adapter.font
    property alias widgets: adapter.widgets

    property alias cornerRadius: adapter.cornerRadius
    property alias contentSpacing: adapter.contentSpacing

    property alias barHeight: adapter.barHeight
    property alias barSeperator: adapter.barSeperator
    property alias seperatorColor: adapter.seperatorColor

    component FontFamily: QtObject {
        property string sans: "IBM Plex Sans"
        property string mono: "JetBrains Mono NF"
        property string material: "Material Symbols Rounded"
    }

    component FontSize: QtObject {
        property int small: 11
        property int smaller: 12
        property int normal: 15
        property int larger: 18
        property int large: 22
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
            property Colors colors: Colors {}

            property FontStuff font: FontStuff {}
            property Widgets.Widgets widgets: Widgets.Widgets {}

            property int cornerRadius: 9
            property int contentSpacing: 2

            property int barHeight: 30
            property bool barSeperator: true
            property string seperatorColor: "#d65d0e"

            property bool showDayOnBar: true
            property bool showDayOfMonthOnBar: true
        }
    }
}

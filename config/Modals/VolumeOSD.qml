pragma ComponentBehavior: Bound
import Quickshell.Hyprland
import Quickshell
import QtQuick
import qs.Services
import qs.Modules

OSDTemplate {
    id: root
    muted: AudioService.sink.audio.muted
    maxValue: 1
    maxOverflow: 1.4
    fillColor: AudioService.sink.audio.muted ? "#fb4934" : "#83a598"
    overflowColor: AudioService.sink.audio.muted ? "#cc241d" : "#458588"

    value: AudioService.sink.audio.volume
    screen: Quickshell.screens[Hyprland.focusedMonitor.id]

    Connections {
        target: root

        function onValueChanged(): void {
            AudioService.sink.audio.volume = root.value;
        }
    }
    Connections {
        target: AudioService

        function onSinkVolumeChanged(): void {
            root.updateOSD();
            root.value = AudioService.sink.audio.volume;
        }

        function onSinkMutedChanged(): void {
            root.updateOSD();
        }
    }

    Timer {
        id: raise

        interval: 20
        onTriggered: {
            if (!raiseVolume.pressed)
                return;
            AudioService.sink.audio.volume = Math.min(AudioService.sink.audio.volume + 0.04, 1.4);
            root.updateOSD();
            restart();
        }
    }

    Shortcut {
        id: raiseVolume
        name: "raise_volume"
        onPressed: raise.start()
    }
    Timer {
        id: lower

        interval: 20
        onTriggered: {
            if (!lowerVolume.pressed)
                return;
            AudioService.sink.audio.volume = Math.max(AudioService.sink.audio.volume - 0.04, 0);
            root.updateOSD();
            restart();
        }
    }

    Shortcut {
        id: lowerVolume
        name: "lower_volume"
        onPressed: lower.start()
    }
}

pragma Singleton
import Quickshell
import Quickshell.Services.UPower

Singleton {
    readonly property UPowerDevice device: UPower.displayDevice
    readonly property bool batteryAvailable: device && device.ready && device.isLaptopBattery
    readonly property int batteryLevel: batteryAvailable ? device.percentage * 100 : 0
    readonly property bool isCharging: batteryAvailable && device.state === UPowerDeviceState.Charging
    readonly property string batteryHealth: batteryAvailable && device.healthSupported ? Math.round(device.healthPercentage * 100) + "%" : "N/A"
    readonly property real batteryCapacity: batteryAvailable && device.energyCapacity > 0 ? device.energyCapacity : 0
    readonly property string batteryStatus: {
        if (!batteryAvailable)
            return "No Battery";

        return UPowerDeviceState.toString(device.state);
    }
    readonly property int timeRemaining: {
        if (!batteryAvailable)
            return 0;

        return isCharging ? (device.timeToFull || 0) : (device.timeToEmpty || 0);
    }
}

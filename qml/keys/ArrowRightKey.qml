// ArrowRightKey.qml
import QtQuick 2.4
import MaliitKeyboard 2.0

ActionKey {
    id: arrowRightKey

    // Optional override, can be set from the keyboard layout
    property var actionKeyOverride: Keyboard.actionKeyOverride
    property string overrideIconName: actionKeyOverride && actionKeyOverride.icon ? actionKeyOverride.icon : ""
    property string overrideLabel: actionKeyOverride && actionKeyOverride.label ? actionKeyOverride.label : ""

    enabled: actionKeyOverride ? actionKeyOverride.enabled : true

    // Label has lower priority than icon
    label: overrideIconName === "" ? (overrideLabel === "" ? "→" : overrideLabel) : ""
    shifted: label

    // Icon used in normal/shift/capsLock states
    iconNormal: overrideIconName === "" ? "keyboard-right-symbolic" : overrideIconName
    iconShifted: iconNormal
    iconCapsLock: iconNormal

    // Key action sent to the input method
    action: "cursor-right"

    // Optional: return to default layer after symbols (if needed)
    switchBackFromSymbols: true
}

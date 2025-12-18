/*
 * ArrowKey.qml
 *
 * Action keys to move the cursor in all four directions
 * Supports Shift for selecting text
 *
 * License: LGPL 3.0
 */

import QtQuick 2.4
import MaliitKeyboard 2.0

ActionKey {
    id: arrowKey

    property string direction: "right" // "left", "up", "down", "right"
    property int moveAmount: 10         // pixels to move the cursor

    label: ""
    width: panel.keyWidth + Device.actionKeyPadding
    overridePressArea: true

    iconNormal: {
        switch (direction) {
            case "up": return "keyboard-up-symbolic"
            case "down": return "keyboard-down-symbolic"
            case "left": return "keyboard-left-symbolic"
            case "right": return "keyboard-right-symbolic"
            default: return ""
        }
    }

    label: iconNormal

    MouseArea {
        id: pressArea
        anchors.fill: parent

        onPressed: {
            Feedback.keyPressed()
            currentlyPressed = true

            // simulate key press
            if (shifted || panel.activeKeypadState === "CAPSLOCK") {
                event_handler.onKeyPressed("", "shift-" + direction)
            } else {
                event_handler.onKeyPressed("", direction)
            }
        }

        onReleased: {
            currentlyPressed = false

            if (shifted || panel.activeKeypadState === "CAPSLOCK") {
                event_handler.onKeyReleased("", "shift-" + direction)
                keySent("")
            } else {
                event_handler.onKeyReleased("", direction)
                keySent("")
            }
        }
    }
}

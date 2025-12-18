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

    MouseArea {
        anchors.fill: parent

        onPressed: {
            Feedback.keyPressed()
        }

        onReleased: {
            // Activate cursor swipe
            fullScreenItem.cursorSwipe = true

            // Determine if Shift is pressed for text selection
            var selecting = fullScreenItem.shiftPressed || fullScreenItem.capsLock

            switch (arrowKey.direction) {
                case "up":
                    fullScreenItem.processSwipe(0, -arrowKey.moveAmount, selecting)
                    break
                case "down":
                    fullScreenItem.processSwipe(0, arrowKey.moveAmount, selecting)
                    break
                case "left":
                    fullScreenItem.processSwipe(-arrowKey.moveAmount, 0, selecting)
                    break
                case "right":
                    fullScreenItem.processSwipe(arrowKey.moveAmount, 0, selecting)
                    break
            }

            fullScreenItem.cursorSwipe = false
        }
    }
}

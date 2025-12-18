import MaliitKeyboard 2.0
import QtQuick 2.4

ActionKey {
    id: navShiftKey
    label: "NAV"       // just for display
    shifted: "NAV"     // optional
    action: "NAV"      // important for Maliit internals

    property string __oldKeypadState: panel.activeKeypadState

    onPressed: {
        Feedback.keyPressed()

        // Toggle NAV keypad
        if (panel.activeKeypadState !== "NAV") {
            __oldKeypadState = panel.activeKeypadState
            panel.activeKeypadState = "NAV"
        } else {
            // Switch back to previous keypad
            panel.activeKeypadState = __oldKeypadState
        }
    }
}

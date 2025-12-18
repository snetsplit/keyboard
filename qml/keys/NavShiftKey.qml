import QtQuick 2.4
import MaliitKeyboard 2.0

ActionKey {
    id: navShiftKey
    label: panel.state == "NAV" ? "ABC" : "NAV"
    shifted: label
    action: "nav"

    // Keep track of previous state
    property string __oldKeypadState: panel.activeKeypadState

    onPressed: {
        Feedback.keyPressed();

        if (panel.state == "CHARACTERS") {
            __oldKeypadState = panel.activeKeypadState
            panel.activeKeypadState = "NAV"
            panel.state = "NAV"
        } else {
            panel.activeKeypadState = __oldKeypadState
            panel.state = "CHARACTERS"
        }
    }
}

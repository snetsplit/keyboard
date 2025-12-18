import QtQuick 2.0
import MaliitKeyboard 2.0

ActionKey {
    id: navKey
    label: panel.state == "NAV" ? "ABC" : "NAV"
    action: "nav"

    property string __oldKeypadState: panel.activeKeypadState

    onPressed: {
        Feedback.keyPressed()

        if (panel.state === "CHARACTERS") {
            __oldKeypadState = panel.activeKeypadState
            panel.activeKeypadState = "NAV"
            panel.state = "NAV"
        } else {
            panel.activeKeypadState = __oldKeypadState
            panel.state = "CHARACTERS"
        }
    }
}

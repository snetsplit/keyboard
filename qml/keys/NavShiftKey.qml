import QtQuick 2.4
import MaliitKeyboard 2.0

import "../keys"

ActionKey {
    label: panel.state == "NAV" ? "ABC" : "NAV"
    shifted: panel.state == "NAV" ? "ABC" : "NAV"
    action: "symbols"

    property string __oldKeypadState: panel.activeKeypadState

    onPressed: {
        Feedback.keyPressed();

        if (panel.state !== "NAV") {
            __oldKeypadState = panel.activeKeypadState;
            panel.activeKeypadState = "NORMAL";
            panel.state = "NAV";
            panel.symbols = "languages/Keyboard_nav.qml"
        } else {
            panel.activeKeypadState = __oldKeypadState;
            panel.state = "CHARACTERS"
            panel.symbols = "languages/Keyboard_symbols.qml"
        }
    }
}

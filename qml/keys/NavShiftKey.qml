import QtQuick 2.4
import MaliitKeyboard 2.0

ActionKey {
    label: panel.state === "NAV" ? "ABC" : "NAV"
    shifted: panel.state === "NAV" ? "ABC" : "NAV"
    action: "navigation";

    overridePressArea: true;

    // Preserve previous keypad state
    property string __oldKeypadState: panel.activeKeypadState

    onPressed: {
        Feedback.keyPressed();

        if (panel.state !== "NAV") {
            __oldKeypadState = panel.activeKeypadState;
            panel.activeKeypadState = "NORMAL";
            panel.state = "NAV";
            panel.navigation = "languages/Keyboard_nav.qml"  // your nav keyboard layout
        } else {
            panel.activeKeypadState = __oldKeypadState;
            panel.state = "CHARACTERS";
            panel.navigation = "languages/Keyboard_symbols.qml"  // revert to default
        }
    }
}

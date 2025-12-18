ActionKey {
    id: navKey
    label: panel.state === "NAV" ? "ABC" : "NAV"
    action: "nav"

    property string __oldKeypadState: panel.activeKeypadState

    onPressed: {
        Feedback.keyPressed()

        if (panel.state === "CHARACTERS") {
            __oldKeypadState = panel.activeKeypadState
            panel.activeKeypadState = "NAV"   // <- THIS must match your keypad file
            panel.state = "NAV"               // <- unique state
        } else {
            panel.activeKeypadState = __oldKeypadState
            panel.state = "CHARACTERS"
        }
    }
}

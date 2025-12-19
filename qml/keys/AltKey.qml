import QtQuick 2.4
import MaliitKeyboard 2.0

ActionKey {
    label: "Alt"
    noMagnifier: true
    skipAutoCaps: true

    overridePressArea: true

    MouseArea {
        anchors.fill: parent

        onPressed: {
            Feedback.keyPressed()
            panel.altActive = !panel.altActive
        }

        onReleased: {
            event_handler.onKeyReleased("", panel.altActive ? "alt" : "")
            keySent("")
        }
    }
}

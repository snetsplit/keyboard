import QtQuick 2.4
import MaliitKeyboard 2.0

ActionKey {
    id: ctrlKey
    label: "Ctrl"
    noMagnifier: true
    skipAutoCaps: true

    property bool active: false

    overridePressArea: true

    MouseArea {
        anchors.fill: parent

        onPressed: {
            Feedback.keyPressed()
            ctrlKey.active = !ctrlKey.active
            panel.ctrlActive = ctrlKey.active
        }

        onReleased: {
            event_handler.onKeyReleased("", ctrlKey.active ? "ctrl" : "")
            keySent("")
        }
    }
}

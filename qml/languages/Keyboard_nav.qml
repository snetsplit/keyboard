import QtQuick 2.4
import MaliitKeyboard 2.0
import "../keys"

KeyPad {
    Column {
        spacing: 0

        Row {
            CtrlKey {}
            AltKey {}
            MetaKey {}
            ShiftKey {}
        }

        Row {
            CharKey { label: "↑"; keycode: Qt.Key_Up }
        }

        Row {
            CharKey { label: "←"; keycode: Qt.Key_Left }
            CharKey { label: "↓"; keycode: Qt.Key_Down }
            CharKey { label: "→"; keycode: Qt.Key_Right }
        }

        Row {
            CharKey { label: "1" }
            CharKey { label: "2" }
            CharKey { label: "3" }
            CharKey { label: "4" }
            CharKey { label: "5" }
        }

        Row {
            BackspaceKey {}
            ReturnKey {}
        }
    }
}

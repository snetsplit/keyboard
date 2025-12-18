import QtQuick 2.4
import MaliitKeyboard 2.0
import keys 1.0

KeyPad {
    id: navPad

    content: Column {
        spacing: 0

        Row {
            CharKey { label: "↑" }
        }
        Row {
            CharKey { label: "←" }
            CharKey { label: "↓" }
            CharKey { label: "→" }
        }
        Row {
            CharKey { label: "Ctrl" }
            CharKey { label: "Alt" }
            CharKey { label: "Meta" }
        }
    }
}

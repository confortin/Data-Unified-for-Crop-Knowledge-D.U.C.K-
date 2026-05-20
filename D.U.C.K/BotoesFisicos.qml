import QtQuick

Item {
    id: root
    focus: true

    // Definimos "sinais" para que o Window saiba quando algo aconteceu
    // sem que este arquivo precise conhecer os detalhes da Window
    signal menuRequested()
    signal upRequested()
    signal downRequested()
    signal confirmRequested()
    signal backRequested()

    Shortcut {
        sequence: "c"
        onActivated: root.menuRequested()
    }

    Shortcut {
        sequence: "v"
        onActivated: root.upRequested()
    }

    Shortcut {
        sequence: "b"
        onActivated: root.downRequested()
    }

    Shortcut {
        sequence: "n"
        onActivated: root.confirmRequested()
    }

    Shortcut {
        sequence: "m"
        onActivated: root.backRequested()
    }


}
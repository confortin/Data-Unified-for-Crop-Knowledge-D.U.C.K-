import QtQuick

Item {
    id: root
    focus: true

    // Sinais para comunicação com o Main.qml
    signal menuRequested()
    signal upRequested()
    signal downRequested()
    signal confirmRequested()
    signal backRequested()

    // O pulo do gato: Captura direta dos eventos de teclado do Linux
    Keys.onPressed: (event) => {
        console.log("Tecla pressionada no hardware:", event.key) // Debug excelente para ver no terminal

        switch (event.key) {
            case Qt.Key_C:
                root.menuRequested()
                event.accepted = true
                break

            case Qt.Key_V:
                root.upRequested()
                event.accepted = true
                break

            case Qt.Key_B:
                root.downRequested()
                event.accepted = true

                break

            case Qt.Key_N:
                root.confirmRequested()
                event.accepted = true

                break

            case Qt.Key_M:
                root.backRequested()
                event.accepted = true
                break

            default:
                // Se for qualquer outra tecla, deixa o sistema processar normalmente
                break
        }
    }

}

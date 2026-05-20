import QtQuick
import QtQuick.VirtualKeyboard
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: window
    width: 820
    height: 640
    visible: true
    title: qsTr("D.U.C.K")
    color:"#003455"
        Shortcut {
            sequences: ["F5", "Ctrl+R"]
            onActivated: {
                console.log("Recarregando a interface...")
                // Como estamos lendo direto do arquivo físico, basta fechar
                // e pedir para a janela ler a si mesma novamente
                window.close()

                // O Qt Creator limpa o cache automaticamente ao salvar se o arquivo for externo.
                // Para atualizar, basta rodar o comando de execução de novo ou usar o atalho interno do Qt.
            }
        }

    Component.onCompleted: hardwareHandler.forceActiveFocus()

    // Mantenha APENAS UM bloco de BotoesFisicos
    BotoesFisicos {
            id: hardwareHandler
            focus: true // <-- Aqui fica TRUE para ele ouvir o teclado!

            onMenuRequested: {
                if (sideMenu.opened) {
                    sideMenu.close()
                } else {
                    sideMenu.open()
                }
            }

            onBackRequested: {
                if (sideMenu.opened) sideMenu.close()
            }
        }


    Drawer {
        id: sideMenu
        width: window.width * 0.3 // Aumentei um pouco (15% era muito estreito)
        height: window.height
        edge: Qt.LeftEdge
        z: 10
        // AS PROPRIEDADES DE CONTEXTO FICAM AQUI DENTRO:
                dim: false
                focus: false

                onOpened: {
                    hardwareHandler.forceActiveFocus()
                }

                onClosed: {
                    hardwareHandler.forceActiveFocus()
                }

                background: Rectangle {
                    color: "gray"
                }
        Column {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 15

            Label {
                text: "Telas de dados"
                font.pixelSize: 20
                font.bold: true
                bottomPadding: 10
            }

            Button {
                id: btnDados
                text: "Dados da Maquina"
                width: parent.width
                focus: true
                onClicked: sideMenu.close()
                // Corrigi os IDs aqui para não dar erro de referência
                KeyNavigation.down: btnSair
            }

            Item { Layout.fillHeight: true; width: 1 }

            Button {
                id: btnSair
                text: "X"
                width: parent.width
                onClicked: sideMenu.close()
                KeyNavigation.up: btnDados
            }
        }
    }

    ToolButton {
        id: menuButton
        text: "☰"
        font.pixelSize: 24
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        z: 1
        onClicked: sideMenu.toggle()
    }

    // Painel do teclado abaixo...
    InputPanel {
        id: inputPanel
        z: 99
        y: window.height
        width: window.width
        // ... (resto do código do teclado igual)
    }
}
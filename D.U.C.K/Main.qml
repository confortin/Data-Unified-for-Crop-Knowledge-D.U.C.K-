import QtQuick
import QtQuick.VirtualKeyboard
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("D.U.C.K")
    color: "#002775"

    Component.onCompleted: window.forceActiveFocus()

    // Mantenha APENAS UM bloco de BotoesFisicos
    BotoesFisicos {
        id: hardwareHandler

        // Use toggle() para o mesmo botão abrir e fechar
        onMenuRequested: sideMenu.toggle()

        onConfirmRequested: console.log("Confirmado via botões Fisicos")

        onBackRequested: {
            if (sideMenu.opened) sideMenu.close()
            else console.log("Voltar pressionado")
        }


    }

    Drawer {
        id: sideMenu
        width: window.width * 0.3 // Aumentei um pouco (15% era muito estreito)
        height: window.height
        edge: Qt.LeftEdge
        z:

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
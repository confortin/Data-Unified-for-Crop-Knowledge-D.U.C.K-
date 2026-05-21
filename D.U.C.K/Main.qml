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
                    btnColheita.forceActiveFocus()
                    botoesMenu[indiceFoco].forceActiveFocus()
                }
            }

            onUpRequested: {
                        if (!sideMenu.opened) return;

                        // Decrementa o índice. Se for menor que 0, volta para o último botão (looping)
                        indiceFoco--
                        if (indiceFoco < 0) {
                            indiceFoco = botoesMenu.length - 1
                        }

                        botoesMenu[indiceFoco].forceActiveFocus()
                        console.log("Focado no botão índice:", indiceFoco)
                    }

            onDownRequested: {
                        if (!sideMenu.opened) return;

                        // Incrementa o índice. Se estourar o tamanho da lista, volta para o primeiro (0)
                        indiceFoco++
                        if (indiceFoco >= botoesMenu.length) {
                            indiceFoco = 0
                        }

                        botoesMenu[indiceFoco].forceActiveFocus()
                        console.log("Focado no botão índice:", indiceFoco)
                    }
            onConfirmRequested: {
                        // Se o item focado for um botão válido e tiver a função de clique
                        if (window.activeFocusItem && typeof window.activeFocusItem.clicked === "function") {
                            console.log("Confirmando botão:", window.activeFocusItem.text)
                            window.activeFocusItem.clicked()
                        }
                        // Tecla M: Voltar (Fecha o menu se estiver aberto)

            onBackRequested: {
                                    if (sideMenu.opened) {
                                        sideMenu.close()
                                    }
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
                id: btnColheita
                text: "DADOS DE COLHEITA" //dados da colheita
                width: parent.width
                focus: true
                activeFocusOnTab: true

                background: Rectangle {
                            // Se este botão ganhar o foco, ele fica vermelho
                            color: btnColheita.visualFocus ? "red" : "#333333"
                            radius: 5
                            border.color: btnColheita.visualFocus ? "white" : "transparent"
                            border.width: 2
                        }

                onClicked: sideMenu.close()
                // Corrigi os IDs aqui para não dar erro de referência
                KeyNavigation.down: btnSair
            }
            Button {
                id: btnClima
                text: "DADOS DE CLIMA"//combustivel
                activeFocusOnTab: true
                width: parent.width
                focus: true

                background: Rectangle {
                            // Se este botão ganhar o foco, ele fica vermelho
                            color: btnClima.visualFocus ? "red" : "#333333"
                            radius: 5
                            border.color: btnClima.visualFocus ? "white" : "transparent"
                            border.width: 2
                        }

                onClicked: sideMenu.close()
                // Corrigi os IDs aqui para não dar erro de referência

                KeyNavigation.down: btnSair

            }
            Button {
                id: btnGPS
                text: "DADOS DE GPS" //mapa gps
                activeFocusOnTab: true
                width: parent.width
                focus: true

                background: Rectangle {
                            // Se este botão ganhar o foco, ele fica vermelho
                            color: btnGPS.visualFocus ? "red" : "#333333"
                            radius: 5
                            border.color: btnGPS.visualFocus ? "white" : "transparent"
                            border.width: 2
                        }

                onClicked: sideMenu.close()
                // Corrigi os IDs aqui para não dar erro de referência
                KeyNavigation.down: btnSair
            }
            Button {
                id: btnSpeed
                text: "DADOS DE VELOCIDADE"//combustivel
                activeFocusOnTab: true
                width: parent.width
                focus: true

                background: Rectangle {
                            // Se este botão ganhar o foco, ele fica vermelho
                            color: btnSpeed.visualFocus ? "red" : "#333333"
                            radius: 5
                            border.color: btnSpeed.visualFocus ? "white" : "transparent"
                            border.width: 2
                        }

                onClicked: sideMenu.close()
                // Corrigi os IDs aqui para não dar erro de referência
                KeyNavigation.down: btnSair
            }
            Button {
                id: btnDados
                text: "DADOS DE MAQUINA"//combustivel
                activeFocusOnTab: true
                width: parent.width
                focus: true

                background: Rectangle {
                            // Se este botão ganhar o foco, ele fica vermelho
                            color: btnDados.visualFocus ? "red" : "#333333"
                            radius: 5
                            border.color: btnDados.visualFocus ? "white" : "transparent"
                            border.width: 2
                        }

                onClicked: sideMenu.close()
                // Corrigi os IDs aqui para não dar erro de referência
                KeyNavigation.down: btnSair
            }

            Item { Layout.fillHeight: true; width: 1 }

            Button {
                id: btnSair
                text: "X"
                width: parent.width
                focus: true

                background: Rectangle {
                            // Se este botão ganhar o foco, ele fica vermelho
                            color: btnSair.visualFocus ? "red" : "#333333"
                            radius: 5
                            border.color: btnSair.visualFocus ? "white" : "transparent"
                            border.width: 2
                        }

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
}
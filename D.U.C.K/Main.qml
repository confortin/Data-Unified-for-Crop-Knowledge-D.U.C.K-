import QtQuick
import QtQuick.VirtualKeyboard
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: window
    width: 920
    height: 440
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
    property int indiceFoco: 0
    property var botoesMenu: []
     // Índice do botão atualmente selecionado no drawer
     property int currentIndex: 0
     // Array com os botões na ordem em que aparecem
     property var menuButtons: [btnColheita, btnClima, btnGPS, btnSpeed, btnDados, btnS]


    Loader {
               id: telaLoader
               anchors.fill: parent
               anchors.leftMargin: sideMenu.opened ? sideMenu.width : 0
               // Opcional: animação suave
               Behavior on anchors.leftMargin { NumberAnimation { duration: 200 } }

               // Tela inicial (por exemplo, um painel padrão)
               source: "Telas/TelaInicial.qml"
           }

    // Mantenha APENAS UM bloco de BotoesFisicos
    BotoesFisicos {
            id: hardwareHandler
            focus: true // <-- Aqui fica TRUE para ele ouvir o teclado!
            onMenuRequested: {
                    if (sideMenu.opened) {
                        sideMenu.close()
                    } else {
                        sideMenu.open()
                        // Não precisa chamar btnColheita.forceActiveFocus() duplicado
                        currentIndex = 0
                    }

                }

                onUpRequested: {
                    if (!sideMenu.opened) return
                                console.log("UP pressionado, drawer opened?", sideMenu.opened)
                                currentIndex = (currentIndex - 1 + menuButtons.length) % menuButtons.length
                                console.log("Selecionado índice:", currentIndex)
                                // Devolve o foco para o hardwareHandler (caso algo tenha roubado)
                                hardwareHandler.forceActiveFocus()
                }

                onDownRequested: {
                    if (!sideMenu.opened) return
                                console.log("UP pressionado, drawer opened?", sideMenu.opened)
                                currentIndex = (currentIndex + 1) % menuButtons.length
                                console.log("Selecionado índice:", currentIndex)
                                hardwareHandler.forceActiveFocus()
                }

                onConfirmRequested: {
                    if (!sideMenu.opened) return
                              var botaoSelecionado = menuButtons[currentIndex]
                              if (botaoSelecionado && typeof botaoSelecionado.clicked === "function") {
                                  console.log("Confirmando:", botaoSelecionado.text)
                                  botaoSelecionado.clicked()
                              }
                              hardwareHandler.forceActiveFocus()
                }

                onBackRequested: {
                    if (sideMenu.opened) sideMenu.close()
                                hardwareHandler.forceActiveFocus()
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
                    if (menuButtons.length === 0) {
                                menuButtons = [btnColheita, btnClima, btnGPS, btnSpeed, btnDados, btnSair]
                            }
                            currentIndex = 0
                            hardwareHandler.forceActiveFocus()
                        }


                onClosed: {

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
                            // Se o índice atual for 0, pinta de vermelho; senão, cinza escuro
                                    color: window.currentIndex === 0 ? "red" : "#333333"
                                    radius: 5
                                    border.color: window.currentIndex === 0 ? "white" : "transparent"
                                    border.width: 2
                        }

                onClicked:{
                    telaLoader.source = "telas/TelaColheita.qml"
                    sideMenu.close()
                }
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
                            color: window.currentIndex === 1 ? "red" : "#333333"
                            radius: 5
                            border.color: window.currentIndex === 1 ? "white" : "transparent"
                            border.width: 2
                        }

                onClicked: {sideMenu.close()
                  telaLoader.source = "telas/TelaCLima.qml"
                }
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
                            color: window.currentIndex === 2 ? "red" : "#333333"
                            radius: 5
                            border.color: window.currentIndex === 2 ? "white" : "transparent"
                            border.width: 2
                        }

                onClicked: {sideMenu.close()
                  telaLoader.source = "telas/TelaGps.qml"
                }
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
                            color: window.currentIndex === 3 ? "red" : "#333333"
                            radius: 5
                            border.color: window.currentIndex === 3 ? "white" : "transparent"
                            border.width: 2
                        }

                onClicked: {sideMenu.close()
                  telaLoader.source = "telas/TelaVelocidade.qml"
                }
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
                            color: window.currentIndex === 4 ? "red" : "#333333"
                            radius: 5
                            border.color: window.currentIndex === 4 ? "white" : "transparent"
                            border.width: 2
                        }

                onClicked: {sideMenu.close()
                  telaLoader.source = "telas/TelaMaquina.qml"
                }
                // Corrigi os IDs aqui para não dar erro de referência
                KeyNavigation.down: btnSair
            }

            Item { Layout.fillHeight: true; width: 1 }

            Button {
                id: btnSair
                text: "HOME"
                width: parent.width
                focus: true

                background: Rectangle {
                            // Se este botão ganhar o foco, ele fica vermelho
                            color: window.currentIndex === 5 ? "red" : "#333333"
                            radius: 5
                            border.color: window.currentIndex === 5 ? "white" : "transparent"
                            border.width: 2
                        }

                onClicked: {
                    telaLoader.source = "telas/TelaHome.qml"
                    sideMenu.close()
                }
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
    Component.onCompleted: {
          menuButtons = [btnColheita, btnClima, btnGPS, btnSpeed, btnDados, btnSair]
          hardwareHandler.forceActiveFocus()
      }
    }

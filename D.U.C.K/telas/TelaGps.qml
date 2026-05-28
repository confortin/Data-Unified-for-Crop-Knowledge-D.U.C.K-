import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: rootTelaGps
    anchors.fill: parent
    color: "#003455" // Mantendo o mesmo azul de fundo do seu projeto

    RowLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 15

        // ==========================================
        // ÁREA DO GPS / MAPA (70% da largura)
        // ==========================================
        Rectangle {
            id: containerGps
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.75 // Garante os 75%

            color: "#4a7a96" // Tom de azul dos seus cards atuais
            radius: 10

            // Conteúdo do seu GPS vai aqui dentro
            Label {
                text: "MAPA / NAVEGAÇÃO GPS"
                color: "white"
                font.bold: true
                font.pixelSize: 22
                anchors.centerIn: parent
            }
        }

        // ==========================================
        // BARRA LATERAL DE INFORMAÇÕES (25% da largura)
        // ==========================================
        Rectangle {
            id: barraLateralInfo
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.25// Garante os 30%

            color: "#2c526d" // Um tom ligeiramente diferente para destacar
            radius: 10

            // Organiza as informações secundárias em uma coluna interna
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 12



                // Exemplo de Card de Informação 1 (ex: Velocidade Atual)
                Rectangle {
                    Layout.row: 0
                    Layout.column: 0
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 100
                    Layout.fillWidth: false  // vai expandir até a largura disponível
                    Text {
                        anchors.centerIn: parent
                        text: "Velocímetro"
                        color: "white"
                        font.pixelSize: 24
                    }
                }

                // Exemplo de Card de Informação 2 (ex: Satélites Conectados)
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 60
                    color: "#38637f"
                    radius: 5

                    Label {
                        text: "Sinal: Excelente (9 Sat.)"
                        color: "white"
                        anchors.centerIn: parent
                    }
                }

                // Item invisível que "empurra" o resto das coisas para cima
                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }
}
import QtQuick
import QtQuick.Layouts
// se ShadowCard estiver em pasta separada

Rectangle {
    color: "#003455"
    width: 800
    height: 600

    GridLayout {
        anchors.fill: parent
        anchors.margins: 20
        columns: 3
        rowSpacing: 15
        columnSpacing: 15

        // Linha 0, coluna 0: Velocímetro
        ShadowCard {
            Layout.row: 0
            Layout.column: 0
            Layout.preferredWidth: 200
            Layout.preferredHeight: 200
            Layout.fillWidth: false  // vai expandir até a largura disponível
            cardColor: "#5587AD"
            Text {
                anchors.centerIn: parent
                text: "Velocímetro"
                color: "white"
                font.pixelSize: 24
            }
        }

        // Linha 0, coluna 1: GPS
        ShadowCard {
            Layout.row: 1
            Layout.column: 0
            Layout.preferredWidth: 200
            Layout.preferredHeight: 200
            Layout.fillWidth: false
            cardColor: "#5587AD"
            Text {
                anchors.centerIn: parent
                text: "GPS"
                color: "white"
                font.pixelSize: 24
            }
        }
        // Linha 1, coluna 2? Não, temos só 2 colunas. O próximo vai para a linha 2.
        // Mas queremos quatro cards pequenos na mesma linha. Para isso, podemos criar um
        // layout aninhado (RowLayout) dentro da célula da primeira coluna,
        // ou então usar columnSpan e rowSpan.

        // Abordagem mais simples: colocar os quatro cards pequenos dentro de um RowLayout
        // que ocupa as 2 colunas.

        Item {
            Layout.row: 1
            Layout.column: 1
            Layout.columnSpan: 2
            Layout.fillWidth: true
            Layout.preferredHeight: 120

            RowLayout {
                anchors.fill: parent
                spacing: 15
                ShadowCard {
                    Layout.preferredWidth: 120
                    Layout.fillHeight: true
                    cardColor: "#5587AD"
                    Text { anchors.centerIn: parent; text: "Chuva"; color: "white" }
                }
                ShadowCard {
                    Layout.preferredWidth: 120
                    Layout.fillHeight: true
                    cardColor: "#5587AD"
                    Text { anchors.centerIn: parent; text: "Temp"; color: "white" }
                }
                ShadowCard {
                    Layout.preferredWidth: 120
                    Layout.fillHeight: true
                    cardColor: "#5587AD"
                    Text { anchors.centerIn: parent; text: "Vento"; color: "white" }
                }
                ShadowCard {
                    Layout.preferredWidth: 120
                    Layout.fillHeight: true
                    cardColor: "#5587AD"
                    Text { anchors.centerIn: parent; text: "ml chuva"; color: "white" }
                }
                Item { Layout.fillWidth: true } // espaçador flexível
            }
        }

        // Plantação ocupa 2 colunas na linha 2
        ShadowCard {
            Layout.row: 0
            Layout.column: 1
            Layout.columnSpan: 2
            Layout.fillWidth: false
            Layout.preferredHeight: 200
            Layout.preferredWidth: 663
            cardColor: "#5587AD"
            Text {
                anchors.centerIn: parent
                text: "Plantação"
                font.pixelSize: 20
                color: "white"
            }
        }

        // Combustível na linha 3, coluna 0
        ShadowCard {
            Layout.row:1
            Layout.column: 2
            Layout.preferredWidth: 125
            Layout.preferredHeight: 200
            cardColor: "#5587AD"
            Text {
                anchors.centerIn: parent
                text: "Combustível"
                color: "white"
            }
        }
    }
}
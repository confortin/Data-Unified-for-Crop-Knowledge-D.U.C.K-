import QtQuick
import QtQuick.Layouts

Rectangle {
    id: homeRoot
    anchors.fill: parent          // 🔹 Preenche todo o espaço da janela
    color: "#003455"

    GridLayout {
        anchors.fill: parent      // 🔹 Expande para ocupar toda a homeRoot
        anchors.margins: 20
        columns: 2
        rowSpacing: 15
        columnSpacing: 15

        // ---------- Velocímetro (0,0) ----------
        ShadowCard {
            Layout.row: 0
            Layout.column: 0
            Layout.fillWidth: true      // Permite expandir horizontalmente
            Layout.fillHeight: true
            Layout.minimumHeight: 140
            Layout.preferredHeight: 1   // Proporção: altura relativa dentro da linha
            cardColor: "#5587AD"
            Text {
                anchors.centerIn: parent
                text: "Velocímetro"
                color: "white"
                font.pixelSize: 24
            }
        }

        // ---------- Plantação (0,1 + 0,2) ----------
        ShadowCard {
            Layout.row: 1
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: 150
            Layout.preferredHeight: 1
            cardColor: "#5587AD"
            Text {
                anchors.centerIn: parent
                text: "Plantação"
                font.pixelSize: 20
                color: "white"
            }
        }

        // ---------- GPS (1,0) ----------
        ShadowCard {
            Layout.row: 0
            Layout.column: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: 150
            Layout.preferredHeight: 1
            Layout.preferredWidth: 700
            cardColor: "#5587AD"
            Text {
                anchors.centerIn: parent
                text: "GPS"
                color: "white"
                font.pixelSize: 24
            }
        }

        // ---------- 4 cards pequenos (1,1 + 1,2) ----------
        Item {
            Layout.row: 1
            Layout.column: 1
            Layout.columnSpan: 2
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 1

            RowLayout {
                anchors.fill: parent
                spacing: 10

                ShadowCard {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    cardColor: "#5587AD"
                    Text { anchors.centerIn: parent; text: "Chuva"; color: "white" }
                }
                ShadowCard {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    cardColor: "#5587AD"
                    Text { anchors.centerIn: parent; text: "Temp"; color: "white" }
                }
                ShadowCard {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    cardColor: "#5587AD"
                    Text { anchors.centerIn: parent; text: "Vento"; color: "white" }
                }
                ShadowCard {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    cardColor: "#5587AD"
                    Text { anchors.centerIn: parent; text: "ml chuva"; color: "white" }
                }
                ShadowCard {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    cardColor: "#5587AD"
                    Text { anchors.centerIn: parent; text: "combustivel"; color: "white" }
                }
            }
        }


        // Espaços vazios para manter proporção (opcional)
        Item { Layout.row: 2; Layout.column: 1; Layout.fillWidth: true; Layout.fillHeight: true }
        Item { Layout.row: 2; Layout.column: 2; Layout.fillWidth: true; Layout.fillHeight: true }
    }
}
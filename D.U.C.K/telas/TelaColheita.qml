import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: rootTelaColheita
    anchors.fill: parent
    color: "#003455"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 15

        // ÁREA PRINCIPAL – DADOS DA COLHEITA (70%)
        Rectangle {
            id: areaColheita
            Layout.fillWidth: true
            Layout.preferredWidth: 7
            Layout.fillHeight: true
            color: "#4a7a96"
            radius: 10

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                Label {
                    text: "DADOS DA COLHEITA"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 22
                    Layout.alignment: Qt.AlignHCenter
                }

                // Informações principais em grid
                GridLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    columns: 2
                    rowSpacing: 10
                    columnSpacing: 10

                    DetailCard { label: "Área plantada"; value: "120 ha" }
                    DetailCard { label: "Tipo de cultura"; value: "Soja" }
                    DetailCard { label: "Estágio"; value: "Floração" }
                    DetailCard { label: "Previsão colheita"; value: "15/07/2026" }
                    DetailCard { label: "Produtividade estimada"; value: "3.200 kg/ha" }
                    DetailCard { label: "Status irrigação"; value: "Ativada" }
                    DetailCard { label: "Última aplicação"; value: "05/06/2026" }
                    DetailCard { label: "Próxima aplicação"; value: "20/06/2026" }
                }
            }
        }

        // BARRA LATERAL – INFORMAÇÕES BÁSICAS (30%)
        Rectangle {
            id: barraLateral
            Layout.fillWidth: true
            Layout.preferredWidth: 3
            Layout.fillHeight: true
            color: "#2c526d"
            radius: 10

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 12

                Label {
                    text: "INFORMAÇÕES"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 18
                    Layout.alignment: Qt.AlignHCenter
                }

                ResumoCard { icon: "🚗"; label: "Velocidade"; value: "12 km/h" }
                ResumoCard { icon: "🌤️"; label: "Clima"; value: "28°C" }
                ResumoCard { icon: "🌱"; label: "Colheita"; value: "Em crescimento" }
                ResumoCard { icon: "⛽"; label: "Combustível"; value: "45%" }

                Item { Layout.fillHeight: true }
            }
        }
    }

    // Componentes internos (iguais aos da TelaClima)
    component DetailCard: Rectangle {
        property string label: ""
        property string value: ""

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.preferredHeight: 60
        color: "#38637f"
        radius: 5

        RowLayout {
            anchors.fill: parent
            anchors.margins: 10
            Label {
                text: label
                color: "white"
                font.pixelSize: 14
                Layout.fillWidth: true
            }
            Label {
                text: value
                color: "white"
                font.bold: true
                font.pixelSize: 14
            }
        }
    }

    component ResumoCard: Rectangle {
        property string icon: ""
        property string label: ""
        property string value: ""

        Layout.fillWidth: true
        Layout.preferredHeight: 60
        color: "#38637f"
        radius: 5

        RowLayout {
            anchors.fill: parent
            anchors.margins: 10
            Label {
                text: icon
                color: "white"
                font.pixelSize: 24
                Layout.preferredWidth: 40
            }
            ColumnLayout {
                Layout.fillWidth: true
                Label {
                    text: label
                    color: "white"
                    font.pixelSize: 14
                    font.bold: true
                }
                Label {
                    text: value
                    color: "#d0e4f0"
                    font.pixelSize: 12
                }
            }
        }
    }
}
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: rootTelaMaquina
    anchors.fill: parent
    color: "#003455"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 15

        // ÁREA PRINCIPAL – DADOS DA MÁQUINA (70%)
        Rectangle {
            id: areaMaquina
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
                    text: "DADOS DA MÁQUINA"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 22
                    Layout.alignment: Qt.AlignHCenter
                }

                // Indicadores principais (combustível, temperatura, etc.)
                GridLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    columns: 2
                    rowSpacing: 10
                    columnSpacing: 10

                    DetailCard { label: "Combustível"; value: "45% (68 L)" }
                    DetailCard { label: "Temperatura motor"; value: "82°C" }
                    DetailCard { label: "Pressão óleo"; value: "3.2 bar" }
                    DetailCard { label: "RPM"; value: "1.800" }
                    DetailCard { label: "Horas de operação"; value: "1.234 h" }
                    DetailCard { label: "Velocidade atual"; value: "12 km/h" }
                    DetailCard { label: "Carga"; value: "75%" }
                    DetailCard { label: "Bateria"; value: "12.4 V" }
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
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: rootTelaVelocidade
    anchors.fill: parent
    color: "#003455"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 15

        // ÁREA PRINCIPAL – VELOCÍMETRO (70%)
        Rectangle {
            id: areaVelocidade
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
                    text: "VELOCÍMETRO"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 22
                    Layout.alignment: Qt.AlignHCenter
                }

                // Velocímetro analógico (simulado com um círculo)
                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredHeight: 200
                    Rectangle {
                        anchors.centerIn: parent
                        width: Math.min(parent.width, parent.height) * 0.8
                        height: width
                        color: "#38637f"
                        radius: width / 2
                        border.color: "white"
                        border.width: 4

                        Label {
                            anchors.centerIn: parent
                            text: "32 km/h"
                            color: "white"
                            font.pixelSize: 36
                            font.bold: true
                        }
                        // Pequeno ponteiro (apenas visual)
                        Rectangle {
                            anchors.centerIn: parent
                            width: parent.width * 0.03
                            height: parent.height * 0.35
                            color: "red"
                            rotation: 45
                            transformOrigin: Item.Bottom
                            anchors.verticalCenterOffset: -parent.height/2 + 10
                        }
                    }
                }

                // Dados adicionais
                GridLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    columns: 2
                    rowSpacing: 10
                    columnSpacing: 10

                    DetailCard { label: "Velocidade média"; value: "28 km/h" }
                    DetailCard { label: "Velocidade máxima"; value: "45 km/h" }
                    DetailCard { label: "Distância percorrida"; value: "1.230 km" }
                    DetailCard { label: "Tempo de viagem"; value: "3h 20min" }
                    DetailCard { label: "RPM médio"; value: "2.100" }
                    DetailCard { label: "Consumo médio"; value: "4.2 km/l" }
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
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: rootTelaClima
    anchors.fill: parent
    color: "#003455"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 15

        // ==========================================
        // ÁREA PRINCIPAL – DETALHES DO CLIMA (70%)
        // ==========================================
        Rectangle {
            id: areaClima
            Layout.fillWidth: true
            Layout.preferredWidth: 7      // 70%
            Layout.fillHeight: true
            color: "#4a7a96"
            radius: 10

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                // Cabeçalho
                Label {
                    text: "CLIMA ATUAL"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 22
                    Layout.alignment: Qt.AlignHCenter
                }

                // Temperatura + condição (em linha)
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    spacing: 20

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#38637f"
                        radius: 8
                        Label {
                            anchors.centerIn: parent
                            text: "28°C"
                            color: "white"
                            font.pixelSize: 40
                            font.bold: true
                        }
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#38637f"
                        radius: 8
                        Label {
                            anchors.centerIn: parent
                            text: "☀️ Ensolarado\nSensação 30°C"
                            color: "white"
                            font.pixelSize: 18
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }

                // Grade de detalhes (umidade, vento, pressão, UV, nascer/pôr do sol)
                GridLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    columns: 2
                    rowSpacing: 10
                    columnSpacing: 10

                    DetailCard { label: "Umidade"; value: "65%" }
                    DetailCard { label: "Vento"; value: "12 km/h" }
                    DetailCard { label: "Pressão"; value: "1013 hPa" }
                    DetailCard { label: "Índice UV"; value: "5 (Moderado)" }
                    DetailCard { label: "Nascer do sol"; value: "06:32" }
                    DetailCard { label: "Pôr do sol"; value: "17:45" }
                }
            }
        }

        // ==========================================
        // BARRA LATERAL – INFORMAÇÕES BÁSICAS (30%)
        // ==========================================
        Rectangle {
            id: barraLateral
            Layout.fillWidth: true
            Layout.preferredWidth: 3      // 30%
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

                // Cards resumidos das outras telas
                ResumoCard { icon: "🚗"; label: "Velocidade"; value: "12 km/h" }
                ResumoCard { icon: "🌤️"; label: "Clima"; value: "28°C" }
                ResumoCard { icon: "🌱"; label: "Colheita"; value: "Em crescimento" }
                ResumoCard { icon: "⛽"; label: "Combustível"; value: "45%" }

                Item { Layout.fillHeight: true }
            }
        }
    }

    // ==========================================
    // COMPONENTES INTERNOS
    // ==========================================

    // Card para detalhes do clima (na área principal)
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

    // Card para resumo das outras telas (na lateral)
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
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent
    color: "#0c1117"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 12

        // =========================================
        // MAPA PRINCIPAL
        // =========================================

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredWidth: 8
            Layout.fillHeight: true

            radius: 12
            color: "#111827"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15

                Label {
                    text: "GPS / NAVEGAÇÃO"
                    color: "#84cc16"
                    font.pixelSize: 24
                    font.bold: true
                }

                Rectangle {

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    radius: 10
                    color: "#161f2b"

                    Label {
                        anchors.centerIn: parent
                        text: "MAPA FARMING SIMULATOR"
                        color: "#6b7280"
                        font.pixelSize: 28
                    }

                    // posição da máquina
                    Rectangle {
                        width: 24
                        height: 24
                        radius: 12

                        x: parent.width * 0.5
                        y: parent.height * 0.5

                        color: "#84cc16"
                    }
                }
            }
        }

        // =========================================
        // PAINEL DIREITO
        // =========================================

        ColumnLayout {

            Layout.preferredWidth: 250
            Layout.fillHeight: true
            spacing: 10

            GpsCard {
                title: "Talhão"
                value: "Norte"
            }

            GpsCard {
                title: "Área"
                value: "25.4 ha"
            }

            GpsCard {
                title: "Linha AB"
                value: "Ativa"
            }

            GpsCard {
                title: "Precisão"
                value: "2 cm"
            }

            GpsCard {
                title: "Distância"
                value: "184 m"
            }
        }

        // =========================================
        // SIDEBAR GLOBAL
        // =========================================

        Rectangle {

            Layout.preferredWidth: 260
            Layout.fillHeight: true

            radius: 12
            color: "#111827"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12

                InfoCard {
                    titulo: "Velocidade"
                    valor: "12 km/h"
                    icone: "🚜"
                }

                InfoCard {
                    titulo: "Combustível"
                    valor: "65%"
                    icone: "⛽"
                }

                InfoCard {
                    titulo: "Colheita"
                    valor: "8.2 t/ha"
                    icone: "🌾"
                }

                InfoCard {
                    titulo: "Clima"
                    valor: "28°C"
                    icone: "☀"
                }

                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }

    component GpsCard : Rectangle {

        property string title
        property string value

        Layout.fillWidth: true
        Layout.fillHeight: true

        radius: 8
        color: "#161f2b"

        Column {
            anchors.centerIn: parent

            Label {
                text: title
                color: "#9ca3af"
            }

            Label {
                text: value
                color: "white"
                font.bold: true
                font.pixelSize: 24
            }
        }
    }

    component InfoCard : Rectangle {

        property string titulo
        property string valor
        property string icone

        Layout.fillWidth: true
        Layout.preferredHeight: 90

        radius: 8
        color: "#161f2b"

        RowLayout {
            anchors.fill: parent
            anchors.margins: 12

            Label {
                text: icone
                font.pixelSize: 24
            }

            Column {
                Label {
                    text: titulo
                    color: "#9ca3af"
                }

                Label {
                    text: valor
                    color: "white"
                    font.bold: true
                    font.pixelSize: 18
                }
            }
        }
    }
}
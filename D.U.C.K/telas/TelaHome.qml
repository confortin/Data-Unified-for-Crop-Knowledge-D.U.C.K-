import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {

    anchors.fill: parent
    color: "#0c1117"

    GridLayout {

        anchors.fill: parent
        anchors.margins: 12

        columns: 2
        rowSpacing: 12
        columnSpacing: 12

        // ===========================
        // GPS
        // ===========================

        Rectangle {

            Layout.fillWidth: true
            Layout.fillHeight: true

            Layout.rowSpan: 2

            radius: 12
            color: "#111827"

            Column {
                anchors.fill: parent
                anchors.margins: 15

                Label {
                    text: "GPS"
                    color: "#84cc16"
                    font.bold: true
                    font.pixelSize: 20
                }

                Rectangle {

                    anchors.horizontalCenter: parent.horizontalCenter

                    width: parent.width
                    height: parent.height - 50

                    radius: 10
                    color: "#161f2b"

                    Label {
                        anchors.centerIn: parent
                        text: "MAPA"
                        color: "#6b7280"
                        font.pixelSize: 28
                    }
                }
            }
        }

        // ===========================
        // VELOCIDADE
        // ===========================

        DashboardCard {
            titulo: "Velocidade"
            valor: "12 km/h"
            icone: "🚜"
        }

        // ===========================
        // COMBUSTÍVEL
        // ===========================

        DashboardCard {
            titulo: "Combustível"
            valor: "65%"
            icone: "⛽"
        }

        // ===========================
        // COLHEITA
        // ===========================

        DashboardCard {
            titulo: "Produtividade"
            valor: "8.2 t/ha"
            icone: "🌾"
        }

        // ===========================
        // CLIMA
        // ===========================

        DashboardCard {
            titulo: "Clima"
            valor: "28°C"
            icone: "☀"
        }
    }

    component DashboardCard : Rectangle {

        property string titulo
        property string valor
        property string icone

        Layout.fillWidth: true
        Layout.fillHeight: true

        radius: 12
        color: "#111827"

        RowLayout {

            anchors.fill: parent
            anchors.margins: 15

            Label {
                text: icone
                font.pixelSize: 32
            }

            Column {

                Label {
                    text: titulo
                    color: "#9ca3af"
                    font.pixelSize: 14
                }

                Label {
                    text: valor
                    color: "white"
                    font.pixelSize: 28
                    font.bold: true
                }
            }
        }
    }
}
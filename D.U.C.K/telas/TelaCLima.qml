import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    anchors.fill: parent
    color: "#0c1117"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 12

        // ======================================
        // AREA PRINCIPAL
        // ======================================

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredWidth: 7
            Layout.fillHeight: true

            radius: 12
            color: "#111827"
            border.color: "#1f2937"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 12

                Label {
                    text: "CLIMA"
                    color: "#84cc16"
                    font.pixelSize: 24
                    font.bold: true
                }

                // ======================================
                // TOPO
                // ======================================

                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 180

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        radius: 10
                        color: "#161f2b"

                        Column {
                            anchors.centerIn: parent
                            spacing: 8

                            Label {
                                text: "☀"
                                color: "#facc15"
                                font.pixelSize: 60
                            }

                            Label {
                                text: "28°C"
                                color: "white"
                                font.pixelSize: 56
                                font.bold: true
                            }

                            Label {
                                text: "Ensolarado"
                                color: "#d1d5db"
                                font.pixelSize: 20
                            }

                            Label {
                                text: "Sensação 30°C"
                                color: "#9ca3af"
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        radius: 10
                        color: "#161f2b"

                        GridLayout {
                            anchors.fill: parent
                            anchors.margins: 15

                            columns: 2

                            ClimaInfo {
                                titulo: "💧 Umidade"
                                valor: "65%"
                            }

                            ClimaInfo {
                                titulo: "💨 Vento"
                                valor: "12 km/h"
                            }

                            ClimaInfo {
                                titulo: "🌡 Pressão"
                                valor: "1013 hPa"
                            }

                            ClimaInfo {
                                titulo: "☀ UV"
                                valor: "5"
                            }
                        }
                    }
                }

                // ======================================
                // SOL
                // ======================================

                RowLayout {

                    Layout.fillWidth: true
                    Layout.preferredHeight: 60

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        radius: 8
                        color: "#161f2b"

                        Label {
                            anchors.centerIn: parent
                            text: "Nascer do Sol 06:32"
                            color: "white"
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        radius: 8
                        color: "#161f2b"

                        Label {
                            anchors.centerIn: parent
                            text: "Pôr do Sol 17:45"
                            color: "white"
                        }
                    }
                }

                // ======================================
                // PREVISÃO
                // ======================================

                Rectangle {

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    radius: 10
                    color: "#161f2b"

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 15

                        Label {
                            text: "PREVISÃO 24H"
                            color: "white"
                            font.bold: true
                            font.pixelSize: 18
                        }

                        RowLayout {
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            ForecastCard {
                                hora: "09:00"
                                temp: "29°C"
                                icone: "☀"
                            }

                            ForecastCard {
                                hora: "12:00"
                                temp: "30°C"
                                icone: "☀"
                            }

                            ForecastCard {
                                hora: "15:00"
                                temp: "31°C"
                                icone: "☀"
                            }

                            ForecastCard {
                                hora: "18:00"
                                temp: "28°C"
                                icone: "🌙"
                            }

                            ForecastCard {
                                hora: "21:00"
                                temp: "24°C"
                                icone: "☁"
                            }

                            ForecastCard {
                                hora: "00:00"
                                temp: "22°C"
                                icone: "☁"
                            }
                        }
                    }
                }
            }
        }

        // ======================================
        // SIDEBAR
        // ======================================

        Rectangle {

            Layout.preferredWidth: 260
            Layout.fillHeight: true

            radius: 12
            color: "#111827"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 10

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
                    titulo: "GPS"
                    valor: "Talhão Norte"
                    icone: "📍"
                }

                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }

    // ======================================
    // COMPONENTES
    // ======================================

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
                font.pixelSize: 26
            }

            Column {
                spacing: 4

                Label {
                    text: titulo
                    color: "#9ca3af"
                }

                Label {
                    text: valor
                    color: "white"
                    font.bold: true
                    font.pixelSize: 20
                }
            }
        }
    }

    component ClimaInfo : Column {

        property string titulo
        property string valor

        spacing: 5

        Label {
            text: parent.titulo
            color: "#9ca3af"
        }

        Label {
            text: parent.valor
            color: "white"
            font.bold: true
            font.pixelSize: 18
        }
    }

    component ForecastCard : Rectangle {

        property string hora
        property string temp
        property string icone

        Layout.fillWidth: true
        Layout.fillHeight: true

        radius: 8
        color: "#111827"

        Column {
            anchors.centerIn: parent
            spacing: 5

            Label {
                text: hora
                color: "#9ca3af"
            }

            Label {
                text: icone
                font.pixelSize: 28
            }

            Label {
                text: temp
                color: "white"
                font.bold: true
            }
        }
    }
}
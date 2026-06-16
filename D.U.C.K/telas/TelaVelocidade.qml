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

        // =====================================
        // ÁREA PRINCIPAL
        // =====================================

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
                    text: "VELOCIDADE"
                    color: "#84cc16"
                    font.pixelSize: 24
                    font.bold: true
                }

                // =====================================
                // VELOCÍMETRO
                // =====================================

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    radius: 12
                    color: "#161f2b"

                    Item {
                        anchors.centerIn: parent
                        width: 350
                        height: 350

                        Rectangle {
                            anchors.fill: parent
                            radius: width / 2
                            color: "#0f172a"
                            border.color: "#334155"
                            border.width: 3
                        }

                        Column {
                            anchors.centerIn: parent
                            spacing: 8

                            Label {
                                text: "45"
                                color: "white"
                                font.pixelSize: 72
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                            }

                            Label {
                                text: "km/h"
                                color: "#9ca3af"
                                font.pixelSize: 24
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    }
                }

                // =====================================
                // CARDS INFERIORES
                // =====================================

                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100

                    MetricCard {
                        title: "Distância"
                        value: "124 km"
                    }

                    MetricCard {
                        title: "Tempo Operação"
                        value: "03:20 h"
                    }

                    MetricCard {
                        title: "Aceleração"
                        value: "0.5 m/s²"
                    }
                }
            }
        }

        // =====================================
        // COLUNA DE DADOS DA VELOCIDADE
        // =====================================

        ColumnLayout {

            Layout.preferredWidth: 220
            Layout.fillHeight: true
            spacing: 10

            SpeedInfo {
                title: "RPM"
                value: "2200"
            }

            SpeedInfo {
                title: "Marcha"
                value: "4"
            }

            SpeedInfo {
                title: "Vel. Média"
                value: "38 km/h"
            }

            SpeedInfo {
                title: "Vel. Máxima"
                value: "62 km/h"
            }
        }

        // =====================================
        // SIDEBAR GLOBAL
        // =====================================

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

    // =====================================
    // COMPONENTES
    // =====================================

    component MetricCard : Rectangle {

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
                font.pixelSize: 22
                font.bold: true
            }
        }
    }

    component SpeedInfo : Rectangle {

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
                font.pixelSize: 26
                font.bold: true
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
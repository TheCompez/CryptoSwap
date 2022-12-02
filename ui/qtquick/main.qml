// Copyright (C) 2022 The Genyleap.
// Copyright (C) 2022 Kambiz Asadzadeh
// SPDX-License-Identifier: LGPL-3.0-only

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

import "Controls" as Controls
import "Cards" as Card

ApplicationWindow {
    id: appRoot
    width: 800
    height: 1080
    visible: true
    title: qsTr("Crypto Swap")
    color: "#d7d8df"

    AppStyle { id: appStyle; }

    FontSystem { id: fontSystem; }

    contentData: SwipeView {
        id: swipeView
        currentIndex: 0
        anchors.fill: parent
        interactive: false

        Page {
            id: firstPage
            background: Rectangle { color: "transparent"; }
            Rectangle {
                anchors.centerIn: parent
                width: 480
                height: 430
                color: appStyle.background
                radius: appStyle.radius

                Item {

                    anchors.fill: parent
                    anchors.margins: 20

                    ColumnLayout {
                        id: columnLayout
                        anchors.fill: parent
                        spacing: 20

                        RowLayout {

                            Text {
                                font.family: fontSystem.getContentFont.name
                                text: qsTr("Swap")
                                font.pixelSize: 16
                                font.bold: true
                            }

                            Item { Layout.fillWidth: true; }

                            Controls.ActionButton {
                                setIcon: "\uf013"
                            }

                            Controls.ActionButton {
                                setIcon: "\uf00d"
                            }

                        }

                        ListModel {
                            id: cryptoModel
                            ListElement {
                                name: "BTC"
                                cprice: 1.0
                                cprice2: 16.972
                                balancePrice: 1323
                                source: "qrc:/Resources/crypto/bitcoin-btc-logo.svg"
                            }
                            ListElement {
                                name: "XLM"
                                cprice: 0.08767
                                cprice2: 0.087649
                                balancePrice: 0.232
                                source: "qrc:/Resources/crypto/stellar-xlm-logo.svg"
                            }
                        }

                        ListView {
                            id: listView
                            width: parent.width
                            Layout.fillWidth: true
                            height: 240
                            spacing: 10
                            model: cryptoModel
                            interactive: false
                            delegate:  Card.CryptoCard {
                                title: name
                                icon: source
                                price: cprice
                                price2: cprice2
                                balance: balancePrice
                            }
                            focus: true
                            move: Transition {
                                NumberAnimation { properties: "y"; duration: appStyle.duration; easing.type: Easing.OutExpo }
                            }
                        }

                        Item { height: 10; }

                        Controls.Button {
                            width: parent.width
                            text: "Preview Swap"
                            onClicked: {
                                swipeView.incrementCurrentIndex()
                            }
                        }
                    }

                    Controls.SwapButton {
                        anchors.centerIn: columnLayout
                        onSwap: {
                            if(listView.currentIndex === 1) {
                                cryptoModel.move(0, 1,1)
                            } else {
                                cryptoModel.move(1, 0,1)
                            }
                        }
                    }
                }
            }
        }
        Page {
            id: secondtPage
            background: Rectangle { color: "transparent"; }
            Rectangle {
                anchors.centerIn: parent
                width: 480
                height: 740
                color: appStyle.background
                radius: appStyle.radius

                Item {

                    anchors.fill: parent
                    anchors.margins: 20

                    ColumnLayout {
                        id: columnLayoutTwo
                        anchors.fill: parent
                        spacing: 20

                        RowLayout {

                            Text {
                                font.family: fontSystem.getContentFont.name
                                text: qsTr("Swap")
                                font.pixelSize: 16
                                font.bold: true
                            }

                            Item { Layout.fillWidth: true; }

                            Controls.ActionButton {
                                setIcon: "\uf013"
                            }

                            Controls.ActionButton {
                                setIcon: "\uf00d"
                            }

                        }

                        ListModel {
                            id: cryptoModel2
                            ListElement {
                                name: "BTC"
                                cprice: 1.0
                                cprice2: 16.972
                                balancePrice: 1323
                                source: "qrc:/Resources/crypto/bitcoin-btc-logo.svg"
                            }
                            ListElement {
                                name: "XLM"
                                cprice: 0.08767
                                cprice2: 0.087649
                                balancePrice: 0.232
                                source: "qrc:/Resources/crypto/stellar-xlm-logo.svg"
                            }
                        }

                        ListView {
                            id: listView2
                            width: parent.width
                            Layout.fillWidth: true
                            height: 240
                            spacing: 10
                            model: cryptoModel
                            interactive: false
                            delegate:  Card.CryptoCard {
                                title: name
                                icon: source
                                price: cprice
                                price2: cprice2
                                balance: balancePrice
                            }
                            focus: true
                            move: Transition {
                                NumberAnimation { properties: "y"; duration: appStyle.duration; easing.type: Easing.OutExpo }
                            }
                        }

                        Item { height: 10; }

                        RowLayout {
                            width: parent.width
                            Layout.fillWidth: true

                            Text {
                                font.family: fontSystem.getAwesomeLight.name
                                font.pixelSize: appStyle.t1
                                font.weight: Font.ExtraLight
                                font.styleName: "Light"
                                color: appStyle.foregroundHovered
                                text: "\uf05a"
                            }

                            Row {
                                spacing: 5

                                Text {
                                    font.family: fontSystem.getContentFont.name
                                    text: qsTr("1 BTC = 193,637.83 XLM")
                                    font.pixelSize: appStyle.h4
                                    font.weight: Font.ExtraLight
                                    font.styleName: "Bold"
                                    color: appStyle.foregroundActivated
                                }
                                Text {
                                    font.family: fontSystem.getContentFont.name
                                    text: qsTr("($16,972.24)")
                                    font.pixelSize: 16
                                    font.weight: Font.ExtraLight
                                    font.styleName: "Bold"
                                    color: appStyle.foregroundHovered
                                }
                            }

                            RowLayout {
                                width: parent.width
                                Layout.fillWidth: true
                                spacing: 5
                                Item { width: 35; }
                                Text {
                                    font.family: fontSystem.getAwesomeLight.name
                                    font.pixelSize: appStyle.h3
                                    font.styleName: "Bold"
                                    color: appStyle.secondry
                                    text: "\uf7e4"
                                }
                                Text {
                                    font.family: fontSystem.getContentFont.name
                                    text: qsTr("($8,97)")
                                    font.pixelSize: appStyle.h4
                                    font.weight: Font.ExtraLight
                                    font.styleName: "Bold"
                                    color: appStyle.foregroundHovered
                                }
                            }

                        }

                        Rectangle {
                            width: parent.width
                            Layout.fillWidth: true
                            height: 240
                            radius: appStyle.radius
                            border.color: appStyle.borderActivated

                            ListModel {
                                id: cryptoModelPrice
                                ListElement {
                                    pos: "begin"
                                    name: "Expected Output"
                                    desc: "1 BTC"
                                    descColor: "#111315"
                                }
                                ListElement {
                                    name: "Price Impact"
                                    desc: "0%"
                                    descColor: "#0cce6b"
                                }
                                ListElement {
                                    name: "Network Fee"
                                    desc: "$1.43"
                                    descColor: "#111315"
                                }
                                ListElement {
                                    pos: "end"
                                    name: "Exchange Fee"
                                    desc: "Free"
                                    descColor: "#0cce6b"
                                }
                            }

                            ListView {
                                id: listViewDetail
                                width: parent.width
                                Layout.fillWidth: true
                                height: 240
                                spacing: 10
                                model: cryptoModelPrice
                                interactive: false
                                delegate:  Item {
                                    width: parent.width
                                    height: 48
                                    ColumnLayout {
                                        width: parent.width
                                        Layout.fillWidth: true
                                        height: 72
                                        RowLayout {
                                            width: parent.width
                                            Layout.fillWidth: true
                                            Item { width: 15; }
                                            spacing: 5
                                            Text {
                                                font.family: fontSystem.getContentFont.name
                                                font.pixelSize: appStyle.h5
                                                font.styleName: "Bold"
                                                color: appStyle.foregroundHovered
                                                text: name
                                                Layout.fillWidth: true
                                            }

                                            Text {
                                                font.family: fontSystem.getContentFont.name
                                                font.pixelSize: appStyle.h5
                                                font.styleName: "Bold"
                                                color: descColor
                                                text: desc
                                            }

                                            Text {
                                                font.family: fontSystem.getAwesomeLight.name
                                                font.pixelSize: appStyle.t1
                                                font.weight: Font.ExtraLight
                                                font.styleName: "Light"
                                                color: appStyle.foregroundHovered
                                                text: "\uf05a"
                                            }
                                            Item { width: 15; }
                                        }
                                        RowLayout {
                                            width: parent.width
                                            Layout.fillWidth: true
                                            Item { width: 15; }
                                            Rectangle {
                                                color: "transparent"
                                                width: parent.width
                                                Layout.fillWidth: true
                                                height: 1
                                                radius: appStyle.radius
                                                border.width: 1
                                                border.color: appStyle.borderActivated
                                                visible: pos === "end" ? false : true
                                            }
                                            Item { width: 15; }
                                        }

                                        Item { width: 5; }
                                    }
                                }
                            }
                        }

                        Controls.Button {
                            width: parent.width
                            text: "Swap Now"
                            onClicked: {
                                swipeView.incrementCurrentIndex()
                            }
                        }
                    }
                }
            }
        }
    }

    footer: RowLayout {
        width: parent.width
        Layout.fillWidth: true
        height: 48
        Item { Layout.fillWidth: true; }
        Text {
            id: copyright
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.family: fontSystem.getContentFont.name
            font.pixelSize: appStyle.t1
            text: qsTr("© 2022 <strong>Kambiz Asadzadeh</strong>,")
            color: appStyle.primary
        }
        Item { Layout.fillWidth: true; }
    }
}

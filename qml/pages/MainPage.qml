/*
  Baby Monitor for SailfishOS
  Copyright (C) 2015  Thomas Zell <t.zell@gmx.de>

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along
  with this program; if not, write to the Free Software Foundation, Inc.,
  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

import "../script/functions.js" as Js

Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        id: flick
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
            MenuItem {
                text: qsTr("Restore Default Settings")
//                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        ScrollDecorator { }

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Baby Monitor")
            }
            Label {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: Theme.paddingLarge
                anchors.rightMargin: Theme.paddingLarge
                text: qsTr("Warning: Alpha-quality code. Only suitable for testing. " +
                            "Please do not use this as a baby monitor! " +
                            "It is almost certainly going to break in unexpected ways.")
                color: Theme.primaryColor
                wrapMode: Text.Wrap
            }
//            Button {
//                text: qsTr("Call")
//                onClicked: voiceCall.typedCall('dial', [{type:'s', value:'telepathy-ring/tel/account0'}, {type:'s', value: phoneNumber.text}])
//            }
//            Button {
//                text: qsTr("Test")
//                onClicked: soundAnalyzer.testsignal()
//            }
            Slider {
                id: thresholdBar

                width:  parent.width
                minimumValue: 0
                maximumValue: 16
                label: qsTr("Sound Level Threshold")
                value: 8
            }
            ProgressBar {
                id: levelBar

                width:  parent.width
                minimumValue: 0
                maximumValue: 16
                label: qsTr("Sound Level")
                value: 0
                Connections {
                    target: soundAnalyzer
                    onSoundLevel: {levelBar.value = level; Js.updateTrigger(level, millis)}
                }
            }
            Slider {
                id: cooldownBar

                width:  parent.width
                label: qsTr("Trigger Cool Down Delay")
                minimumValue: 0
                maximumValue: 5
                value: 1
            }
            Slider {
                id: delayBar

                width:  parent.width
                label: qsTr("Trigger Threshold")
                minimumValue: 0
                maximumValue: 10
                value: 5
            }
            ProgressBar {
                id: triggerBar

                width:  parent.width
                label: qsTr("Trigger")
                minimumValue: 0
                maximumValue: 10
                value: 0
            }
            TextSwitch {
                id: armSwitch

                width:  parent.width
                text: qsTr("Armed")
                checked: appActive;
                automaticCheck: false;
                onClicked: {
                    appActive = !appActive;
                }
            }
            TextField {
                id: phoneNumber

                width:  parent.width
                label: qsTr("Phone Number")
                placeholderText: qsTr("Please Enter Phone Number")
                inputMethodHints: Qt.ImhDialableCharactersOnly
            }
        }
    }
}



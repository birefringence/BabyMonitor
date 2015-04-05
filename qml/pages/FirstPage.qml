/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

import "../script/functions.js" as Js

Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("UI Template")
            }
            Label {
                x: Theme.paddingLarge
                text: qsTr("Hello Sailors")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Button {
                text: qsTr("Call")
                onClicked: voiceCall.typedCall('dial', [{type:'s', value:'telepathy-ring/tel/account0'}, {type:'s', value:'0123456789'}])
            }
            Button {
                text: qsTr("Test")
                onClicked: soundAnalyzer.testsignal()
            }
            Slider {
                id: thresholdBar

                width:  parent.width
                minimumValue: 0
                maximumValue: 16
                label: "Threshold"
                value: 8
            }
            ProgressBar {
                id: levelBar

                width:  parent.width
                minimumValue: 0
                maximumValue: 16
                label: "Level"
                value: 0
                Connections {
                    target: soundAnalyzer
                    onSoundLevel: {levelBar.value = level; Js.updateTrigger(level, millis)}
                }
            }
            Slider {
                id: cooldownBar

                width:  parent.width
                label: "Cool Down"
                minimumValue: 0
                maximumValue: 5
                value: 1
            }
            Slider {
                id: delayBar

                width:  parent.width
                label: "Delay"
                minimumValue: 0
                maximumValue: 10
                value: 5
            }
            ProgressBar {
                id: triggerBar

                width:  parent.width
                label: "Trigger"
                minimumValue: 0
                maximumValue: 10
                value: 0
            }
            TextSwitch {
                id: arm

                width:  parent.width
                text: "Armed"
            }
        }
    }
}



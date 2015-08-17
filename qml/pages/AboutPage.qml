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


Page {
    id: page

    SilicaFlickable {
        id: flick
        anchors.fill: parent
        contentHeight: column.height

        ScrollDecorator { }

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge

            PageHeader { title: qsTr("About") }

            Label {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: Theme.paddingLarge
                anchors.rightMargin: Theme.paddingLarge
                width: parent.width
                textFormat: Text.RichText
                onLinkActivated: Qt.openUrlExternally(link)
                color: Theme.primaryColor
                wrapMode: Text.Wrap
                text: "<style>a:link { color: " + Theme.highlightColor + "; }</style>" +
                      "<p>Baby Monitor for SailfishOS<br>" +
                      "Copyright (C) 2015  <a href='mailto:Thomas Zell <t.zell@gmx.de>'>" +
                      "Thomas Zell &lt;t.zell@gmx.de&gt;</a></p>" +

                      "<p>This program is free software; you can redistribute it and/or modify " +
                      "it under the terms of the GNU General Public License as published by " +
                      "the Free Software Foundation; either version 2 of the License, or " +
                      "(at your option) any later version.</p>" +

                      "<p>This program is distributed in the hope that it will be useful, " +
                      "but WITHOUT ANY WARRANTY; without even the implied warranty of " +
                      "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the " +
                      "GNU General Public License for more details.</p>" +

                      "<p>You should have received a copy of the GNU General Public License along " +
                      "with this program; if not, write to the Free Software Foundation, Inc., " +
                      "51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.</p>" +

                      "<p>The source code is available under " +
                      "<a href='https://github.com/birefringence/harbour-babymonitor'>" +
                      "https://github.com/birefringence/harbour-babymonitor</a></p>"
            }
        }
    }
}






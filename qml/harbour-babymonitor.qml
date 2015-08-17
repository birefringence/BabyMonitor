/*
  Baby Monitor for SailfishOS
  Copyright (C) 2015  Thomas Zell <t.zell@gmx.de>

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  any later version.

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
import "pages"

import org.nemomobile.dbus 2.0

ApplicationWindow
{
    initialPage: Component { MainPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
//    property string coverIcon: "image://theme/icon-cover-play"
//    property string coverString: qsTr("inactive")
    property bool appActive: false;

    DBusInterface {
        id: voiceCall

        service: 'org.nemomobile.voicecall'
        path: '/'
        iface: 'org.nemomobile.voicecall.VoiceCallManager'
    }

}



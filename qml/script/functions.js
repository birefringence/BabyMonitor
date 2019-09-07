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

var trigger = 0;
var delay = 0;
var deadTime = 0;

function updateTrigger(level, millis) {
    if (deadTime > 0) {
        deadTime -= millis/1000;
        remainingDeadBar.value = deadTime / 60;
    } else {
        deadTime = 0;
        remainingDeadBar.value = 0;

        if (level > thresholdBar.value) {
            trigger += millis/1000;
            triggerBar.value = trigger;
            delay = 0;
        } else {
            if (delay > cooldownBar.value && trigger > 0) {
                trigger -= millis/1000;
                if (trigger < 0) {
                    trigger = 0;
                }
                triggerBar.value = trigger;
            } else {
                delay += millis/1000;
            }
        }
        if (trigger > delayBar.value) {
            trigger = 0;
            triggerBar.value = 0;
            delay = 0;
            deadTime = deadTimeBar.value*60;
            if (armSwitch.checked) {
                voiceCall.typedCall('dial', [{type:'s', value:'/org/freedesktop/Telepathy/Account/ring/tel/ril_0'}, {type:'s', value: phoneNumber.text}]);
            } else {
                notification.publish();
            }
        }
    }
}

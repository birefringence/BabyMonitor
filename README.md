# Baby Monitor
Baby Monitor App for SailfishOS.

This is my first attempt at creating a native baby monitor app for Sailfish. Its interface is similar to an Android app of the same name. Please use this version for testing only. It will most likely not work if the device is not plugged in because of the power saving mode.

## Parameters

Sound Level Threshold: Defines at which minimum sound level the trigger bar will fill.

Sound Level: Displays the sound level currently recorded by the microphone. When the level is above the threshold defined by the sound level threshold slider, the trigger bar will fill.

Trigger Cool Down Delay: Defines how may seconds the trigger bar will remain at its current position when the sound level is below the threshold.

Trigger Threshold: Defined at which trigger bar level the call will be triggered.

Trigger: Displays the current trigger value. When the value is above the threshold defined by the trigger threshold slider, the call will be triggered.

Dead Time: Defined how many minutes the app will wait after a triggered call until the next call can be triggered.

Remaining Dead Time: No new calls will be triggered, until this bar is empty.

Armed: If unset, only a notification is shown but no call is triggered.

Phone Number: Phone number that will be called if trigger reaches the threshold.

## Possible future improvements

* Directly select phone number from your contacts.
* Option to disable device suspend mode.
* Automatically mute phone when active.
* Auto answering of incoming calls.
* Enable speaker phone when call is active.

## Further remarks

Currently, the UI is very technical. I would appreciate any suggestions on improving usability.

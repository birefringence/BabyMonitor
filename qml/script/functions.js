var trigger = 0;
var delay = 0;

function updateTrigger(level, millis) {
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
    if (trigger > delayBar.value && armSwitch.checked) {
        trigger = 0;
        triggerBar.value = 0;
        delay = 0;
        voiceCall.typedCall('dial', [{type:'s', value:'telepathy-ring/tel/account0'}, {type:'s', value: phoneNumber.text}]);
    }
}

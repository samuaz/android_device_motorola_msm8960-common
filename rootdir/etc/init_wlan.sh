#!/system/bin/sh

insmod /system/lib/modules/wlan.ko
kill -9 `pidof NetworkManager`

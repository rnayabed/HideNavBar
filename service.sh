#!/system/bin/sh
MODDIR=${0%/*}
INFO=/data/adb/modules/.HideNavBar-files
MODID=HideNavBar
LIBDIR=/system
MODPATH=/data/adb/modules/HideNavBar
APIE=$(cat /system/build.prop | grep ro.build.version.sdk | cut -d '='-f2)

while [ "$(getprop sys.boot_completed | tr -d '\r')" != "1" ]; do sleep 1; done
sleep 1
cmd overlay fabricate --target android --name nav1 android:dimen/navigation_bar_height 0x05 0x1
cmd overlay enable com.android.shell:nav1
cmd overlay fabricate --target android --name nav android:dimen/navigation_bar_frame_height 0x05 0x1
cmd overlay enable com.android.shell:nav
cmd overlay fabricate --target android --name test3 android:dimen/navigation_bar_gesture_height 0x05 0x600
cmd overlay enable com.android.shell:test3


#!/system/bin/sh

## For compatibility reasons, competing script(s) and file(s) are removed.
## ipdev @ xda-developers

# Module Directory
MDIR=${0%/*}
# Magisk Modules Directory
MMDIR=${MDIR%/*}
# ADB Directory
ADB=${MMDIR%/*}

## Check and remove Vanced YouTube Music scripts and files.
[[ -f $ADB/post-fs-data.d/music.sh ]] && rm $ADB/post-fs-data.d/music.sh;
[[ -f $ADB/service.d/music.sh ]] && rm $ADB/service.d/music.sh;
[[ -d $ADB/Music ]] && rm -rf $ADB/Music;

## Check and remove ReVanced YouTube Music scripts and files.
[[ -f $ADB/post-fs-data.d/com.google.android.apps.youtube.music.sh ]] && rm $ADB/post-fs-data.d/com.google.android.apps.youtube.music.sh;
[[ -f $ADB/service.d/com.google.android.apps.youtube.music.sh ]] && rm $ADB/service.d/com.google.android.apps.youtube.music.sh;
[[ -d /data/local/tmp/revanced-manager/com.google.android.apps.youtube.music ]] && rm -rf /data/local/tmp/revanced-manager/com.google.android.apps.youtube.music;

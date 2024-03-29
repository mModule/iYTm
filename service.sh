#!/system/bin/sh

## This script is part of the iYT module project.
## ipdev @ xda-developers

## Requires YouTube Music to be installed as a user app.
## Required YouTube Music version is 5.36.51

## Module directory(s) set by Magisk.
MODDIR=${0%/*}

# Module Directory
MDIR=${0%/*}
# Magisk Modules Directory
MMDIR=${MDIR%/*}
# ADB Directory
ADB=${MMDIR%/*}

# Required versionCode.
RYTMVC=53651240

# Required architecture.
# ARCH=arm64-v8a
# ARCH=armeabi-v7a

# Get SDK level and architecture.
SDK=$(getprop ro.build.version.sdk);
# ARCH=$(getprop ro.product.cpu.abi);

# # Check YTM architecture..
# if [ ! $ABI = $ARCH ]; then
# 	echo "$(date '+%Y%m%d_%H%M')" "Wrong architecture." >>$MODDIR/error.log;
# 	YTMMOD=ABORT;
# fi;

# Find and set YouTube Music path.
if [ $SDK -ge 30 ]; then
	YTMPATH=$(readlink -f /data/app/*/com.google.android.apps.youtube.music*/lib | sed 's/\/lib//g');
else
	YTMPATH=$(readlink -f /data/app/com.google.android.apps.youtube.music*/lib | sed 's/\/lib//g');
fi;

# Check YouTube Music path.
if [ ! -f $YTMPATH/base.apk ]; then
	echo "$(date '+%Y%m%d_%H%M')" "No user installed YouTube path found." >>$MODDIR/error.log;
	YTMMOD=ABORT;
fi;

# Find installed (active) YouTube Music versionCode.
if [ -z $YTMMOD ]; then
	while [ -z $YTMVC ]; do
		YTMVC=$(dumpsys package com.google.android.apps.youtube.music | grep versionCode | cut -f2 -d'=' | tr -d '\n' | cut -f1 -d' ');
		date +%N > /dev/null;
	done;
fi;

# Check YouTube Music versionCode.
if [ ! $YTMVC = $RYTMVC ]; then
	echo "$(date '+%Y%m%d_%H%M')" "Wrong version of YouTube Music found." >>$MODDIR/error.log;
	YTMMOD=ABORT;
elif [ -z $YTMVC ]; then
	echo "$(date '+%Y%m%d_%H%M')" "No user installed version of YouTube Music found." >>$MODDIR/error.log;
	YTMMOD=ABORT;
fi;

# Mount if failsafe(s) pass.
if [ -z $YTMMOD ]; then
	su -c mount $ADB/iytm/base.apk $YTMPATH/base.apk;
fi;

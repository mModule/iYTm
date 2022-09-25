#!/bin/bash

## Inject YouTube Music
## ipdev @ xda-developers

# Set main variables
DATE=$(date '+%Y%m%d')
TDIR=$(pwd)
SDIR="$TDIR"/staging
OUT="$TDIR"/out/"$DATE"

# Set additional variables
NAME=iYTMusic
IYTv7a=NONE
IYTv8a=NONE
BUZv7a=NONE
BUZv8a=NONE

# Set main functions

check_dir() {
	[[ ! -d $OUT ]] && mkdir -p $OUT;
	[[ ! -d $SDIR ]] && mkdir -p $SDIR;
}

# Set additional functions

backup() {
	if [ -f "$OUT"/"$ZIPNAME" ]; then
		FLTM=$(date -r "$OUT"/"$ZIPNAME" '+%H%M');
		BACKUPFILE=$(printf "$ZIPNAME" | sed 's/.zip/-'"$FLTM".zip'/g');
		mv "$OUT"/"$ZIPNAME" "$OUT"/"$BACKUPFILE";
		if [ $MODID = v7a ]; then
			BUZv7a=""$OUT"/"$BACKUPFILE"";
		fi;

		if [ $MODID = v8a ]; then
			BUZv8a=""$OUT"/"$BACKUPFILE"";
		fi;
	fi;
}

change_log() {
	echo "## YouTube Music v"$VNAME"" >update.md;
	echo "" >>update.md;
	echo "- Module updated to YouTube Music v"$VNAME"" >>update.md;
	# echo "<br>" >>update.md;
	echo "- Requires YouTube Music to also be updated to v_"$VNAME"_." >>update.md;
}

create_json() {
	JSON="$TDIR"/iytm"$MODID".json

	echo "{" >"$JSON";
	echo "  \"versionCode\": \""$VCODE"\"," >>"$JSON";
	echo "  \"version\": \"Module\"," >>"$JSON";
	# echo "  \"version\": \""$VNAME"\"," >>$JSON;
	echo "  \"zipUrl\": \"https://github.com/mModule/iYTm/releases/download/v"$VNAME"/"$ZIPNAME"\"," >>"$JSON";
	echo "  \"changelog\": \"https://github.com/mModule/iYTm/releases/download/v"$VNAME"/update.md\"" >>"$JSON";
	echo "}" >>"$JSON";
}

edit_service_script() {
	if [ "$(uname -s)" = Darwin ]; then
		RNAME=$(grep "Required YouTube Music" service.sh | cut -f7 -d' ');
		sed -i "" s/$RNAME/$VNAME/ service.sh;
		RCODE=$(grep "RYTMVC=" service.sh);
		sed -i "" s/$RCODE/RYTMVC=$VCODE/ service.sh;
	else
		RNAME=$(grep "Required YouTube Music" service.sh | cut -f7 -d' ');
		sed -i s/$RNAME/$VNAME/ service.sh;
		RCODE=$(grep "RYTMVC=" service.sh);
		sed -i s/$RCODE/RYTMVC=$VCODE/ service.sh;
	fi;
}

# get_app_abi() {
# 	ABI=$(aapt dump badging base.apk | grep native-code | cut -f2 -d "'");
# 	if [ $ABI = armeabi-v7a ]; then
# 		ARCH=arm
# 	elif [ $ABI = arm64-v8a ]; then
# 		ARCH=arm64
# 	fi
# }

get_app_version() {
	VCODE=$(aapt dump badging base.apk| grep version | cut -f4 -d"'");
	VNAME=$(aapt dump badging base.apk| grep version | cut -f6 -d"'");
	VER=$(aapt dump badging base.apk| grep version | cut -f6 -d"'" | sed 's/\.//g');
}

module_prop() {
	echo "id=iytm_"$ARCH"" >>module.prop
	echo "name=Inject YouTube Music" >>module.prop
	echo "version=Module" >>module.prop
	# echo "version=""$VER" >>module.prop
	echo "versionCode="$VCODE"" >>module.prop
	echo "author=ip" >>module.prop
	echo "description=YouTube Music v"$VNAME" ("$ARCH")" >>module.prop
	echo "updateJson=https://raw.githubusercontent.com/mModule/iYTm/master/iytm"$MODID".json" >>module.prop
}

# Check and create directory(s) if needed.
check_dir

# Make zip file(s).

if [ -f music_arm.apk ]; then
	echo ""; echo "iYT Music (arm)";
	ARCH=arm
	MODID=v7a
	# THEME="Music"
	cp -rf META-INF "$SDIR"
	cp customize.sh "$SDIR"
	cp post-fs-data.sh "$SDIR"
	cp service.sh "$SDIR"
	cp music_arm.apk "$SDIR"/base.apk
	cd "$SDIR"
	# get_app_abi
	get_app_version
	module_prop
	edit_service_script
	ZIPNAME="$NAME"-v"$VER"-"$ARCH".zip
	IYTv7a=""$OUT"/"$ZIPNAME""
	zip -r "$ZIPNAME" META-INF/* base.apk customize.sh module.prop post-fs-data.sh service.sh
	backup
	create_json
	change_log
	mv "$ZIPNAME" "$OUT"
	mv update.md "$OUT"
	rm -rf *
	cd "$TDIR"
fi;

if [ -f music_arm64.apk ]; then
	echo ""; echo "iYT Music (arm64)";
	ARCH=arm64
	MODID=v8a
	# THEME="Music"
	cp -rf META-INF "$SDIR"
	cp customize.sh "$SDIR"
	cp post-fs-data.sh "$SDIR"
	cp service.sh "$SDIR"
	cp music_arm64.apk "$SDIR"/base.apk
	cd "$SDIR"
	# get_app_abi
	get_app_version
	module_prop
	edit_service_script
	ZIPNAME="$NAME"-v"$VER"-"$ARCH".zip
	IYTv8a=""$OUT"/"$ZIPNAME""
	zip -r "$ZIPNAME" META-INF/* base.apk customize.sh module.prop post-fs-data.sh service.sh
	backup
	create_json
	change_log
	mv "$ZIPNAME" "$OUT"
	mv update.md "$OUT"
	rm -rf *
	cd "$TDIR"
fi;

if [ ! -f music_arm.apk ] | [ ! -f music_arm64.apk ]; then
	echo ""; echo "Nothing to do.";
fi;

# Note backup file(s).
if [ -f $BUZv7a ] || [ -f $BUZv8a ]; then
	echo ""; echo "Your previous zip file(s) renamed.";
fi;

if [ -f $BUZv7a ]; then
	echo " iYT Music (arm) backup as "$BUZv7a"";
fi;

if [ -f $BUZv8a ]; then
	echo " iYT Music (arm64) backup as "$BUZv8a"";
fi;

# Note new file(s).
if [ -f $IYTv7a ] || [ -f $IYTv8a ]; then
	echo ""; echo "New zip file(s).";
fi;

if [ -f $IYTv7a ]; then
	echo " iYT Music (arm) saved as "$IYTv7a"";
fi;

if [ -f $IYTv8a ]; then
	echo " iYT Music (arm64) saved as "$IYTv8a"";
fi;

# Finish script.
echo ""; echo "Done."; echo "";
exit 0;

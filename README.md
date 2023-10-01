## Inject YouTube Music

### Description
Magisk module that overlays a modified (patched) version over the regular version.<br>
_This is done by using the `mount` command to mount (overlay) one file/directory over the other_.<br>

### Requirement(s)
Google _YouTube Music_ to be installed as a _user_ app.<br>
Must be the same build as the patched version.
- Note: This has to be a full apk install. Not a split-apk install.


### Download
Available in the releases tab. [Link](https://github.com/mModule/iYTm/releases)

### How to install.
- Install regular (stock) YouTube Music.
- Copy the module zip file to the device.
- Open Magisk Manager, select Modules and then Install from storage.
- Select the zip file and install.
- Reboot device.<br>

### Recent changes
- Update to YouTube Music v6.21.51
<!-- - Switch to [inotia00's](https://github.com/inotia00/revanced-patches) patches.<br> -->

### How to
_Still need to create the wiki pages :roll_eyes:_
- [Make the Module](https://github.com/mModule/iYTm/wiki/MakeModule)
- [Install YouTube](https://github.com/mModule/iYTm/wiki/YouTube)

Module support:<br>
- xdaDevelopers [Inject YouTube](https://forum.xda-developers.com/t/module-inject-youtube.4512121)

### About
This module includes a modified YouTube Music app.<br>
The modified version is created by patching the stock version using ReVanced. <br>
For more information on ReVanced.<br>
- See the [ReVanced](https://github.com/revanced) project.
- Currently using [inotia00's](https://github.com/inotia00/revanced-patches) patches.<br>

<b>Patches included in this Module</b>
<details>

| Patch | Description |
|:--------:|:--------------:|
| `background-play` | Enables playing music in the background. |
| `bitrate-default-value` | Set the audio quality to "Always High" when you first install the app. |
| `certificate-spoof` | Spoofs the YouTube Music certificate for Android Auto. |
| `disable-auto-captions` | Disables forced auto captions. |
| `enable-black-navigation-bar` | Sets the navigation bar color to black. |
| `enable-color-match-player` | Matches the color of the mini player and the fullscreen player. |
| `enable-compact-dialog` | Enable compact dialog on phone. |
| `enable-force-minimized-player` | Keep player permanently minimized even if another track is played. |
| `enable-landscape-mode` | Enables entry into landscape mode by screen rotation on the phone. |
| `enable-minimized-playback` | Enables minimized playback on Kids music. |
| `enable-opus-codec` | Enable opus codec when playing audio. |
| `exclusive-audio-playback` | Enables the option to play music without video. |
| `hide-button-shelf` | Hides the button shelf from homepage and explorer. |
| `hide-carousel-shelf` | Hides the carousel shelf from homepage and explorer. |
| `hide-cast-button` | Hides the cast button. |
| `hide-category-bar` | Hides the music category bar at the top of the homepage. |
| `hide-get-premium` | Hides "Get Premium" label from the account menu or settings. |
| `hide-music-ads` | Hides ads before playing a music. |
| `hide-navigation-bar-component` | Hides navigation bar components. |
| `hide-new-playlist-button` | Hides the "New playlist" button in the library. |
| `hide-playlist-card` | Hides the playlist card from homepage. |
| `hide-taste-builder` | Hides the "Tell us which artists you like" card from homepage. |
| `remember-video-quality` | Save the video quality value whenever you change the video quality. |
| `settings` | Adds settings for ReVanced to YouTube Music. |
</details>

---

#### Notes
- Feel free to use, change, improve, adapt.
- Remember to share.

### Credits
- The Android Community and everyone who has helped me learn through the years.
- John Wu and team for all things [Magisk](https://github.com/topjohnwu/Magisk).
- Vanced.
- ReVanced.
<!-- - [inotia00](https://github.com/inotia00/revanced-patches) for patches. -->
- Everyone that has contributed to YouTube modifications.<br>

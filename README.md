<h1 align="center">TrimUI Smart Pro Tools</h1>

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
  <img src="https://img.shields.io/badge/bash-red" />
  <img src="https://img.shields.io/badge/contributions-welcome-orange.svg" />
  <img src="https://img.shields.io/badge/license-MIT-green" />
</p>

<p align="center">
  <strong>Simple tools for TrimUI Smart Pro console</strong><br>
  Not responsible for anything that happens to your device. 
</p>

<p align="center">
  Support me by buying a coffee: <a href="https://www.buymeacoffee.com/djware">Buy Me a Coffee</a> ☕
</p>

## 🚀 Tools
![ftp2](https://github.com/djware/TrimUITools/assets/85318457/6004e545-38d7-4c9c-b71c-553cc8478147)
- **FTP**: App that starts FTP on the device. Run it again to turn it off. It will also time out after 5 minuntes of inactivity.
- modify the code to set the root password. Remove the "#" and line 7
```
# echo -e "root\nroot" | passwd root
```

---

![iconftp](https://github.com/djware/TrimUITools/assets/85318457/c076b0af-af75-4e9c-94fe-89054457c265)
- **FTP Enable**: App that enables FTP on your device. Mounts the /mnt/SDCARD. Run then restart your device and your device will have ftp on all the time. Run the app again to disable this option from boot.
- Username: root 
- Password: root
---
![telnetd](https://github.com/djware/TrimUITools/assets/85318457/d1c2034d-343d-47b7-ac8c-ba05afa26d37)
- **Telnetd**: App that enables you to have the ability to telnet to your device and also adds it to boot. Only needs to be ran once. It does reset your root credentials to be Username:root Password:root

<b>I didn't make the telnetd app. I just created the script that adds it to the rc.local file so it runs at boot. </b>

This script moves the telnetd-static file to /mnt/SDCARD and renames it to "telnetd" and then adds the line "/mnt/SDCARD/telnetd" to the top of the rc.local file. 
```
Courtesy of HYJiNX187 and the guy that built the busybox binary:
https://github.com/therealsaumil/static-arm-bins/blob/master/telnetd-static

Note: This is designed for Tomato version 1.3 created by Jutleys of RGH 
https://github.com/jutleys/Trimui-Smart-Tomato

Copy the contents of this zip file into /Apps/
Run Telnetd
Connect to your Trimui Smart over port 23 using your favorite telnet client.

WARNING: I am arbitrarily setting your root password to 'root'.  
```
---
![randomicon](https://github.com/djware/TrimUITools/assets/85318457/0f2aee38-2e48-4cdf-ba67-8644ad814dd6)
- **Random Game**: This app chooses a random Emulator and Rom that matches that emulator.
```bash
Modify directory if you want it to be a dedicated emulator folder.
rom_base_dir="/mnt/SDCARD/Roms"
emu_base_dir="/mnt/SDCARD/Emus"
```
---
![maxcpu](https://github.com/djware/TrimUITools/assets/85318457/8ea8c75d-8995-47ba-935e-6e266c69cf2c)
- **Max CPU**: This app forces the device to use Performance mode at all times. This can be useful incase you haven't setup performance mode, hit the FN Button, reset the device, or did an update it and it removed user data. This runs a script in the background that tells the device to use its Performance mode even if its been changed.
If successful the LEDs will change to the color green.
 ```bash
Updates: echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
```
---
![reboot](https://github.com/djware/TrimUITools/assets/85318457/d926453a-d7ec-4339-9a0f-2071b4a80ca9)
- **Reboot App**: Restart your device with ease and efficiency.
---
***4/14/2024 Update***
If you've updated to Trimui Smart Pro 1.0.4 hotfix 20240414 you don't need to use this app. It now comes with a mac update. 

![macaddress](https://github.com/djware/TrimUITools/assets/85318457/14d7905b-1a8e-4722-abed-dfe5758f9b00)
- **Mac Update**: updates the mac address to be static.
---
![Rainbowleds](https://github.com/djware/TrimUITools/assets/85318457/d84b670a-32d3-46fd-b7f4-f407e7760c0d)
- **RainbowLEDS**: This app changes the colors of the LED to each color slowly in loop. Run the app again to end it.
![trimuigif](https://github.com/djware/TrimUITools/assets/85318457/b400b949-bcbd-4e86-a8cd-9bc2011ccf46)
---
![ledtemp](https://github.com/djware/TrimUITools/assets/85318457/09741147-8560-4230-883c-c178dd75b4e8)
- **LED Temp**: This app changes the colors of the LEDs to reflect the color of the CPU. Run the app again to end it.
 ```bash
Temps under 40 degrees show Green
Temps between 40-45 degrees show Chartreuse Green
Temps between 45-50 degrees show Yellow
Temps between 50-55 degrees show Orange
Temps between 55-60 degrees show Dark Oragen
Temps between 60-65 degrees show Red Orange
Temps between 65-70 degrees show Vermilion
Temps over 70 degrees show red
```
---
![batlogo](https://github.com/djware/TrimUITools/assets/85318457/db2a28f4-9070-4c4d-bec2-7954ef520bc0)
- **LED Batt**: This app changes the colors of the LEDs to reflect the percent left on the battery. Run the app again to end it.
 ```bash
        100|9[0-9]) set_led_color 0 255 0 ;; # Green
        8[0-9]|7[0-9]) set_led_color 127 255 0 ;; # Chartreuse Green
        6[0-9]) set_led_color 255 255 0 ;; # Yellow
        5[0-9]) set_led_color 255 165 0 ;; # Orange
        4[0-9]) set_led_color 255 140 0 ;; # Dark Orange
        3[0-9]) set_led_color 255 69 0 ;; # Red Orange
        2[0-9]) set_led_color 255 20 0 ;; # Vermilion
        *) set_led_color 255 0 0 ;; # Red
```
---

![logo4](https://github.com/djware/TrimUITools/assets/85318457/3de61ce1-2126-48d9-8e13-5e7a08da9fc9)
- **UDISK**: Unlocks the local storage on the device for you to use and access.
<p align="center">
**USE AT YOUR OWN RISK, THIS FORMATS UDISK PARTITION**
</p>

![image](https://github.com/djware/TrimUITools/assets/85318457/bf762dc9-a96b-48ae-a332-0cf3e75eb4fd)

This app formats and unlocks the UDISK partition allowing you to access 6 GB of local storage on your device to store Apps, Emulators, and more. 
The app backs up your data, formats UDISK in fat32, and restores the user data to it. This will also remove the internal usb_storage app and replace it with a 
updated usb_storage app which allows you to mount both SDCARD and UDISK to your computer at the same time or just UDISK if you don't have a SDCARD in. You can download the core SD files to use them on /mnt/UDISK. https://github.com/trimui/assets_smartpro

![image](https://github.com/djware/TrimUITools/assets/85318457/86fb5a8c-9551-42ac-896f-9811df58a00f)


Extract files to your SDCARD and run the UDISK app. It runs in the background and you may see screen dim for a moment. After its complete you can launch usb_storage app. 
<b>Only needs to be ran once.</b>
## 📥 Installation

```bash
Copy the folders inside the Tools folder to /SDCARD/Apps/ and usb_storage to the root of the SDCARD /SDCARD
📁 /mnt/SDCARD/Apps/
└── 📁UDISK
📁 /mnt/SDCARD/usb_storage

```


---
![bootlogo](https://github.com/djware/TrimUITools/assets/85318457/5a60d189-3851-4a20-85ac-72e0240fe586)
- **Bootlogo Updater**: Customize your startup experience by updating the boot image to a photo of your choice.

![Bootlogo](https://github.com/djware/TrimUITools/assets/85318457/bb3a55c7-9d00-4c50-b1c7-3cc8821ea600)

<b>Add your image to the root of your SDCARD and rename it to logo. It has to be in .bmp format. Should look like logo.bmp</b>
Might take a few trys You can have the logo on either /mnt/SDCARD or /mnt/UDISK. 

📁 /mnt/SDCARD/

└── 🖼️ logo.bmp

  - **Requirements**: 
    - Format: `.bmp`
    - Size: Under 6 MB
    - Resolution: Up to 1280x720px

<p align="center">
  <img src="https://github.com/djware/TrimUITools/assets/85318457/984e3cf0-b26b-4869-a449-0b93e74f4805" alt="logo">
</p>
<p align="center">Example logo</p>
## 🛠 More Tools Coming Soon!

Stay tuned for more exciting tools designed to enhance your TrimUI Smart Pro experience.

## 📥 Installation

```bash
Copy the folders inside the Tools folder to /SDCARD/Apps/
📁 /mnt/SDCARD/Apps/

└── 📁Reboot
└── 📁Bootlogo
```

Log files are stored on SDCARD
## ✨ Tips
If you're looking to create your own LED apps below are some functions to help you out. Built into the device. 
```
[TRIMUI LED Animation driver] 
    max_scale : maxium LED brightness in dec [0 ~ tg5040 limit brightness 60] 
    frame     : raw frames for total 23 XRGB 32bpp data 
    frame_hex : frames for total 23 XRGB 32bpp data in hex format "RRGGBB RRGGBB RRGGBB ... RRGGBB " end with space. 
    
[usage of anim to function] 
    effect_lr: Left and right joystick LEDS effect type. 
    effect_l: Left joystick LEDS effect type. 
    effect_r: Right joystick LEDS effect type. 
    effect_m : middle LED effect type. 
   (effect_x for a trigger of effect start) 
    effect_names : show the effect types description. 
    effect_duration_lr: Left and right joystick LEDS animation durations. 
    effect_duration_l: Left joystick LEDS animation durations. 
    effect_duration_r: Right joystick LEDS animation durations. 
    effect_duration_m : middle LED effect duration. 
    effect_rgb_hex_lr: Left and right LED all target color in format "RRGGBB " end with space. 
    effect_rgb_hex_l: Left LED all target color in format "RRGGBB " end with space. 
    effect_rgb_hex_r: Left LED all target color in format "RRGGBB " end with space. 
    effect_rgb_hex_m: Middle LED target color in format "RRGGBB " end with space. 
    effect_cycles_lr: Left and right joystick LEDS animation loops. 
    effect_cycles_l: Left joystick LEDS animation loops. 
    effect_cycles_r: Right joystick LEDS animation loops. 
    effect_cycles_m : middle LED effect loops. 
   (cycles value: 0 for stop, -1 for endless loop, > 0 for loop times) 
    effect_enable   : toggle of anim to function 
	 
[usage of framebuffer animation function !!Did not finish yet!!] 
    anim_frames:       raw frames for total XRGB 32bpp data, buffer length 10 sec@60fps, 23 data per frame. 
    anim_frames_hex:   same as anim_frames and use hex format "RRGGBB RRGGBB RRGGBB ... RRGGBB " end with space. 
    anim_frames_cycle: animation loops count 
    anim_frames_enable : toggle of frames anim function 
    anim_frames_override_m_enable: toggle of middle LED in frames anim function. 
```

<p align="center">
  Made with ❤️ by djware
</p>


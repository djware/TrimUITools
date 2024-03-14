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

---

## 🚀 Tools

![reboot](https://github.com/djware/TrimUITools/assets/85318457/d926453a-d7ec-4339-9a0f-2071b4a80ca9)
- **Reboot App**: Restart your device with ease and efficiency.
---
![macaddress](https://github.com/djware/TrimUITools/assets/85318457/14d7905b-1a8e-4722-abed-dfe5758f9b00)
- **Mac Update**: updates the mac address to be static.
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
<p align="center">
  Made with ❤️ by djware
</p>


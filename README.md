# GabozePocaioLakka
Want to run Lakka on your Gaboze Pocaio 2.6" Screen?

* Move tft folder to /storage
* ssh in
```
cd tft
chmod 777 IILI9341
chmod 777 IILI9342
```
* test
```
cd
tft/ILI9341
tft/ILI9342
```
ctrl+c to exit
* make it boot
```
nano /storage/.config/autostart.sh
```

```
# Uncomment appropriate line
#/storage/tft/ILI9341 & # 2.4" TFT
#/storage/tft/ILI9342 & # 2.6" TFT
```
ctrl+x
y

```
reboot now
```

```
shutdown now
```

mount sd
* Move pwm-audio-pi-zero-overlay.dtbo folder to /flash/overlays

config.txt
```
################################################################################
# 2.6 ILI9342
# 2.4 ILI9341
################################################################################
hdmi_group=2
hdmi_mode=87
hdmi_cvt=320 240 60 1 0 0 0
hdmi_force_hotplug=1
overscan_scale=1

################################################################################
# Audio
################################################################################
dtparam=audio=on
dtoverlay=pwm-audio-pi-zero-overlay
```

mount
move retrogame folder to /storage

* ssh in
```
nano /etc/udev/rules.d/10-retrogame.rules
SUBSYSTEM=="input", ATTRS{name}=="retrogame", ENV{ID_INPUT_KEYBOARD}="1"
```


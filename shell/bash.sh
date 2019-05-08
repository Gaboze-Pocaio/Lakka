# this file is only used for github linguist
# use line by line
git clone https://github.com/32teeth/Lakka-For-Gaboze-Pocaio.git
scp -r ~/[path_to_where_you_cloned_the_repo]/backgrounds root@[ip_of_your_raspberry_pi]:
scp -r ~/[path_to_where_you_cloned_the_repo]/retrogame root@[ip_of_your_raspberry_pi]:
scp -r ~/[path_to_where_you_cloned_the_repo]/tft root@[ip_of_your_raspberry_pi]
scp ~/[path_to_where_you_cloned_the_repo]/retroarch/retroarch.cfg root@[ip_of_your_raspberry_pi]:.config/retroarch
ssh root@[ip_address]
chmod 777 tft/ILI9341 tft/ILI9342
chmod 777 -R retrogame
nano /storage/.config/autostart.sh
# Uncomment appropriate line
#/storage/tft/ILI9341 & # 2.4" TFT
#/storage/tft/ILI9342 & # 2.6" TFT
# Keyboard GPIO
/storage/retrogame/retrogame &
# Uncomment appropriate line
#/storage/tft/ILI9341 & # 2.4" TFT
/storage/tft/ILI9342 & # 2.6" TFT
# Keyboard GPIO
/storage/retrogame/retrogame &
nano /etc/udev/rules.d/10-retrogame.rules
SUBSYSTEM=="input", ATTRS{name}=="retrogame", ENV{ID_INPUT_KEYBOARD}="1"
shutdown now
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
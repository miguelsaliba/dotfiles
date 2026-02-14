HDMI_D1=0x11
DP_D1=0x0f

HDMI_D2=0x01
DP_D2=0x04

MAIN_DISPLAY=1
INPUT_VCP=60

get_current() {
  current=$(ddcutil getvcp $INPUT_VCP --display "$MAIN_DISPLAY" --brief | awk '{print $(NF)}')
  echo "0$current"
}

current=$(get_current)

if [ $current == $HDMI_D1 ]; then
	current_display="HDMI"
elif [ $current == $DP_D1 ]; then
	current_display="DP"
else
	echo "error finding current display, assuming 1"
	current_display="HDMI"
fi

if [ $current_display == "HDMI" ]; then
	ddcutil setvcp $INPUT_VCP $DP_D1 --display 1
	ddcutil setvcp $INPUT_VCP $DP_D2 --display 2
else
	ddcutil setvcp $INPUT_VCP $HDMI_D1 --display 1
	ddcutil setvcp $INPUT_VCP $HDMI_D2 --display 2
fi


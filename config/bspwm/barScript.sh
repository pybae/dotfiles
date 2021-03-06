#!/bin/bash

WHITE=#FFf0ebcd
DARK=#FF568090
LIGHT=#FFc08158

# ----- Summer ----- #
#DARK=#FF648ea7
#LIGHT=#FF91b6c6
# ----- PINK ----- #
#DARK=#FFf36b6b
#LIGHT=#FFff897d

# ----- Bliss ----- #
#DARK=#FF1369ee
#LIGHT=#FF6997ed

workspace(){
	SPACE_NUM=$(bspc query -D -d);
		case "$SPACE_NUM" in
			"1")
				WORKSPACE="■ □ □ □ □";;
			"2")
				WORKSPACE="□ ■ □ □ □";;
			"3")
				WORKSPACE="□ □ ■ □ □";;
			"4")
				WORKSPACE="□ □ □ ■ □";;
			"5")
				WORKSPACE="□ □ □ □ ■";;
		esac
	echo -n $WORKSPACE
}

chg(){
	echo -n  $(acpi --battery | awk '{gsub(/,/, "");} {print $4}')
}

bat(){ 
	echo -n  $(acpi -a | if grep -q "on-line"; then echo -n ""; else echo -n "⭫ $(chg)%"; fi)
}

ram(){
	echo -n  $(free -m | awk '/Mem/ {print $3}')
}

dat(){
	echo -n  $(date "+%H:%M  %D")
}

vol(){
	echo -n  $(amixer | if grep -q "off"; then echo -n "mute"; else echo -n $(amixer | awk '/Front Left: Playback/ {print $5}' | sed 's/\[//g;s/\]//g');fi)
}

mus(){
	echo -n  $(test -z "$(mpc current)" || mpc current -f %title%)
	#echo -n $(ps aux | grep -v "grep" | if grep -q "cmus"; then echo $(cmus-remote -Q | sed -n 's/tag title //p'); else echo "n/a"; fi)
}

paws(){
	echo -n  $(mpc | if grep -q "paused"; then echo -n "▮▮"; else echo -n "♫"; fi)
	#echo -n $(cmus-remote -Q | if grep -q "paused"; then echo -n "▮▮"; else echo -n "♫"; fi)
}

while :; do
	printf "%s\n" "%{Sl} %{A:mpc toggle:}%{B$DARK} %{F$WHITE}$(paws) %{F$DARK}%{B$LIGHT}%{A}%{A:osd:}%{F-}%{B-}%{F$WHITE}%{B$LIGHT} $(mus) %{B-}%{F-}%{F$LIGHT}%{B-}%{A}%{c}%{B$DARK}%{F$WHITE}%{B-}%{F-}%{B$DARK} %{F$WHITE}$(workspace) %{B-}%{F-}%{F$WHITE}%{B$DARK}%{B-}%{F-}%{c}%{r}%{F$LIGHT}%{F-}%{B$LIGHT}%{F$WHITE} ram $(ram) vol $(vol)% %{B-}%{F-}%{F$DARK}%{B$LIGHT}%{F-}%{B-}%{B$DARK}%{F$WHITE} $(dat) %{B-}%{F-}"
sleep 1
done

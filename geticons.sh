#!/usr/bin/env/bash
# This script will download the required
# Skill associated icons from the runescape website.

x=(
	http://www.runescape.com/img/hiscores/skill_icon_attack1.gif
	http://www.runescape.com/img/hiscores/skill_icon_defence1.gif
	http://www.runescape.com/img/hiscores/skill_icon_strength1.gif
	http://www.runescape.com/img/hiscores/skill_icon_hitpoints1.gif
	http://www.runescape.com/img/hiscores/skill_icon_ranged1.gif
	http://www.runescape.com/img/hiscores/skill_icon_prayer1.gif
	http://www.runescape.com/img/hiscores/skill_icon_magic1.gif
	http://www.runescape.com/img/hiscores/skill_icon_cooking1.gif
	http://www.runescape.com/img/hiscores/skill_icon_woodcutting1.gif
	http://www.runescape.com/img/hiscores/skill_icon_fletching1.gif
	http://www.runescape.com/img/hiscores/skill_icon_fishing1.gif
	http://www.runescape.com/img/hiscores/skill_icon_firemaking1.gif
	http://www.runescape.com/img/hiscores/skill_icon_crafting1.gif
	http://www.runescape.com/img/hiscores/skill_icon_smithing1.gif
	http://www.runescape.com/img/hiscores/skill_icon_mining1.gif
	http://www.runescape.com/img/hiscores/skill_icon_herblore1.gif
	http://www.runescape.com/img/hiscores/skill_icon_agility1.gif
	http://www.runescape.com/img/hiscores/skill_icon_thieving1.gif
	http://www.runescape.com/img/hiscores/skill_icon_slayer1.gif
	http://www.runescape.com/img/hiscores/skill_icon_farming1.gif
	http://www.runescape.com/img/hiscores/skill_icon_runecraft1.gif
	http://www.runescape.com/img/hiscores/skill_icon_hunter1.gif
	http://www.runescape.com/img/hiscores/skill_icon_construction1.gif
	http://www.runescape.com/img/hiscores/skill_icon_summoning1.gif
	http://www.runescape.com/img/hiscores/skill_icon_dungeoneering1.gif
)

i=0

for icon in ${x[@]}
do
	wget ${x[i]}
	let "i +=1"
done

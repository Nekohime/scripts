#!/usr/bin/env bash
# Made by Nekohime (Nekohime.net) (https://github.com/Nekohime/)
# Released under CC0 1.0 Universal (https://creativecommons.org/publicdomain/zero/1.0/)
# Yes, it is public domain. Do what you want with it.

# Downloads the RuneScape Hiscores for Player $1 (or provided default)
# If debugging the outputted JSON, try `$ python -m json.tool file.json`
#set -euo pipefail # Debugging

playerName=${1:-Nekohime} # :)
url="https://secure.runescape.com/m=hiscore/index_lite.ws?player=$playerName" # https://secure.runescape.com/m=hiscore/index_lite.ws?player=Nekohime

hiscores_csv=$playerName.csv # Hiscors CSV filename
hiscores_json=$playerName.json # Hiscores JSON filename

#if [ ! -f ./$hiscores_json ]; then # We don't actually need this... if would actually prevent us from updating. Could fix by making an --update flag. Not rn though.

  wget -q $url -O ./$hiscores_csv.tmp # Download the Hiscore for $playerName into a temporary file
  sed '29,$d' $hiscores_csv.tmp > $hiscores_csv # Cut the minigame bs out of the temporary csv file
  rm $hiscores_csv.tmp # Delte the temporary file as we're done with it

# The List of RuneScape Skills. Their names lowercased. 26 of them + overall/total stuff
declare -a skillsList=(
"overall" "attack" "defence" "strength" "constitution" "ranged" "prayer" "magic"
"cooking" "woodcutting" "fletching" "fishing" "firemaking" "crafting" "smithing"
"mining" "herblore" "agility" "thieving" "slayer" "farming" "runecrafting"
"hunter" "construction" "summoning" "dungeoneering" "divination" "invention")

#We read the csv file into an array called skillsCSV
readarray csvLines < $hiscores_csv


jsonOutput+="{" # Starting JSON...

for ((i=0;i<${#csvLines[@]};++i)); do # Black Magic
  IFS=',' read -a splitValues <<< ${csvLines[$i]}
  if [ "$i" -ne 27 ]; then
    jsonOutput+="\"${skillsList[$i]}\": { \"rank\": ${splitValues[0]}, \"level\": ${splitValues[1]}, \"experience\": ${splitValues[2]} },"
  else
    jsonOutput+="\"${skillsList[$i]}\": { \"rank\": ${splitValues[0]}, \"level\": ${splitValues[1]}, \"experience\": ${splitValues[2]} }"
  fi
done

jsonOutput+="}" # Ending JSON...
#echo $jsonOutput #This is here for displaying in terminal when debugging the script
echo $jsonOutput > $hiscores_json
rm $hiscores_csv
#fi # end of this if, earlier in the script: if [ ! -f ./$hiscores_json ]; then
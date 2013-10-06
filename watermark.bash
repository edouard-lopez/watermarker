#!/usr/bin/env bash
# DESCRIPTION
#   description
#
# USAGE
#   bash ./watermark.bash
#
# @author: Édouard Lopez <dev+project@edouard-lopez.com>

shopt -s globstar

originalDir="original"
outputDir="output"
wmImage="${1:-./watermark.png}"
wmText="${2:-$(cat ./watermark.txt)}"
wmConvertArgs=(
  -size 140x80 xc:none -fill #80808080
  -font Arial -pointsize 20
  -draw "gravity NorthEast fill black  text 0,12 '$wmText' fill white  text 1,11 '$wmText'"
  miff:-
)
wmCompositeArgs=(
  -dissolve 40% -gravity NorthWest
  -geometry +10+10
)

  # convert "${wmConvertArgs[@]}" |
  convert -size 300x50 xc:none -font Arial -pointsize 20 -gravity center -draw "fill white text 1,1 'Tequipment.net' text 0,0 'Tequipment.net' fill black text -1,-1 'Tequipment.net'" | composite "${wmCompositeArgs[@]}" "$wmImage" "$i" "$o"
  for i in "$originalDir"/**;
  do
    [[ -d "$i" ]] && continue # skip directory

    printf "processing: %s\n" "$i"
    od="$outputDir/$(dirname "${i#$originalDir/}")"
    [[ ! -d "$od" ]] && mkdir -p "$od"
    o="$od/$(basename "$i")"
  done

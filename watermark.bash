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
wmTextFile="watermark-text.png"
wmImage="${1:-./watermark.png}"
wmText="${1:-$(cat ./watermark.txt)}"
  wmTxtMargin="+0%+5%" # wm offset to border of original image
  fz=20 # font size

function create_wm_text() {
  let textLength="${#wmText}"
  let textHeight=$(($fz*15/10)) # text-box height
  let textWidth=$(($textLength*12)) # text-box width

  wmConvertArgs=(
    -size ${textWidth}x${textHeight} xc:none
    -fill '#80808080'
    -font DejaVu-Sans-Book -pointsize "$fz"
    -gravity Center
    -draw "fill black text 0,2 '$wmText' fill white  text 1,1 '$wmText'"
  )

  convert "${wmConvertArgs[@]}" "$wmTextFile"
}
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
create_wm_text

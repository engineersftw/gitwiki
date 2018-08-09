#!/bin/bash
SOURCE=$1
echo "Looking inside $SOURCE now..."

for f in $SOURCE/*
do
  file=$(basename "$f")
  folder="${f%/*}"
  filename="${file%.*}"
  echo "Processing folder: $folder and file: $file ($filename)"

  working_folder="$folder/$filename"
  working_filename="$folder/$filename/$filename"
  working_sourcefile="$folder/$filename/$file"

  destination_folder="$folder/normalized"
  mkdir -p "$destination_folder"

  echo "Copying $f to ./$working_folder"
  mkdir -p $working_folder
  cp $f ./$working_folder

  ffmpeg -i $working_sourcefile -c copy "$working_filename-temp.mp4"
  ffmpeg -i "$working_filename-temp.mp4" "$working_filename-audio.wav"
  sox "$working_filename-audio.wav" "$working_filename-temp.wav" compand 1,2 -80,-80,-55,-15,-10,-10,0,0 -7 -30 1 &&
  sox "$working_filename-temp.wav" "$working_filename-leveled.wav" --norm

  ffmpeg -i "$working_filename-temp.mp4" -i "$working_filename-leveled.wav" -vcodec h264 -preset ultrafast -crf 18 -acodec aac -strict experimental -ac 2 -ab 114k -map 0:0 -map 1:0 "$working_filename-norm.mp4"
  # ffmpeg -i "$working_filename-temp.mp4" -i "$working_filename-leveled.wav" -vcodec copy -acodec aac -strict experimental -ac 2 -ab 114k -map 0:0 -map 1:0 "$working_filename-norm.mp4"
  rm "$working_sourcefile" "$working_filename-temp.mp4" "$working_filename-audio.wav" "$working_filename-leveled.wav" "$working_filename-temp.wav"

  mv "$working_filename-norm.mp4" "$destination_folder"
  rm -rf "$working_folder"
done

#!/bin/sh

SOURCE=$1
echo "Looking inside $SOURCE now..."

for f in $SOURCE/*.ts
do
  file=$(basename "$f")
  folder="${f%/*}"
  filename="${file%.*}"
  echo "Processing folder: $folder and file: $file ($filename)"

  working_file="$folder/$file"
  destination_folder="$folder/converted"
  destination_filename="$destination_folder/$filename"

  mkdir -p "$destination_folder"

  ffmpeg -i $working_file -acodec copy -vcodec copy "$destination_filename-converted.mp4"

  echo "Done converting $file"
done

echo "Done with all files in $SOURCE"

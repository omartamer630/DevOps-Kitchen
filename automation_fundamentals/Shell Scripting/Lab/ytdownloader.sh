#!/bin/bash

url=$1
playlist_name=$2

# Check if the directory exists, if not, create it
[ -d youtube_folder ] || mkdir youtube_folder

# Navigate into the youtube_folder
cd youtube_folder || exit

# Check if playlist_name is provided and navigate into it
if [ -n "${playlist_name}" ]; then
  mkdir -p "${playlist_name}"
  cd "${playlist_name}" || exit
else
  echo "Error: Playlist name not provided or empty"
  exit 1
fi

# Download the playlist
if ! command -v yt-dlp &> /dev/null; then
    echo "yt-dlp could not be found. Please install it."
    exit 1
fi

yt-dlp "${url}"

# Create a list file for ffmpeg
if [ ! -f list.txt ]; then
  touch list.txt
fi

> list.txt # Clear the list.txt file

# Append all mp4 files to the list
for i in *.mp4; do
  if [ -f "$i" ]; then
    echo "file '$i'" >> list.txt
  else
    echo "No .mp4 files found."
    exit 1
  fi
done

# Concatenate videos using ffmpeg
if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg could not be found. Please install it."
    exit 1
fi

ffmpeg -f concat -safe 0 -i list.txt -c copy "${playlist_name}.mp4"

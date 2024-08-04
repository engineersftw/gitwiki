# Scripts we use

## Pre-Requisites

#### [For Mac Users] Install the following
Make sure you have brew installed on your mac first! Go to [http://brew.sh](http://brew.sh/) and follow the instructions there to install brew on your mac.

- Install **sox** by running ``brew install sox`` on your terminal

- Install **ffmpeg** by running ``brew install ffmpeg``on your terminal

Without these 2, **you will not be able to run** some of the scripts in this repository. In particular, ``multinorm.sh``


## 1. Audio normalization of video files (`multinorm.sh`)

- We use this script to normalize the audio of multiple video files.
- It creates a new folder called `normalized` and puts the rendered file in there.
- ***Attribution***: This script was based on [Sayanee Basu's](https://github.com/sayanee) [`norm`](https://github.com/sayanee/build-podcast/blob/master/automation/norm) script.
	
### Usage:
	
```bash
$ ./multinorm.sh ./<folder_name>
```
	
***Important:** Please replace spaces with underscore in your folder name and file names.(eg. `my_videos` instead of `my videos` and `video_file.mov` instead of `video file.mov`).


## 2. Remove front part of a video (`cutfront.sh`)

- When you started the recording too early, this script helps you remove the first few seconds of the video.
- This will generate a new file.

### Usage:

```bash
$ ./cutfront.sh <path_to_input_file> <time_stamp> <path_to_output_file>
```

## 3. Remove back part of a video (`cutback.sh`)

- When you ended the recording long after the presentation is done, this script helps you remove the last few seconds of the video.
- This will generate a new file.

### Usage:

```bash
$ ./cutback.sh <path_to_input_file> <time_stamp> <path_to_output_file>
```

## 4. Join multiple video files into a new video file

- Use this when you want to join multiple files into 1 video file

### Steps:

1. Run this command to create a text file with the list of all the files you want to combine:

	```
	ls -1 > files.txt
	```
	
2. Edit `files.txt` and remove the lines of the files you don't want to use.

3. Add `file ./` to the front of each line such that it ends up like this:

	```
	file ./video1.mp4
	file ./video2.mp4
	file ./video3.mp4
	```
	
4. Run this command in the folder
	
	```
	ffmpeg -f concat -safe 0 -i files.txt -c copy <name_of_combined_file.mp4>
	```
	
	This `ffmpeg` command will create a new combined file of all the videos in `files.txt`.

## 5. Generate thumbnail from file (`genthumb.sh`)

- Generates a thumbnail of the video at the time stamp supplied (eg. `00:00:12`)
- Creates a `thumbnail` folder and generates a `jpg` and `png` version of the thumbnail.

### Usage:

```bash
$ ./genthumb.sh <video_file> <time_stamp>
```

## 6. Converts a folder of `.ts` files to `.mp4` files (`copyts.sh`)

### Usage:

```bash
$ ./copyts.sh ./<folder_name>
```

## Running with Docker

1. Build the Docker Image

	```bash
	docker build -t esg-tools .
	```

2. Run the Docker Container and mount your working folder into the container.

	```bash
	docker run -it --rm -v <path_to_working_folder>:/app/<folder_name> esg-tools
	```

	**Example:**

	```
	docker run -it --rm -v $PWD/videos:/app/videos esg-tools
	docker run -it --rm -v %CD%/videos:/app/videos esg-tools
	```

	> To refer to the currect directory, use `$PWD` in Linux / Mac and use `%CD%` in Windows Command Prompt.

3. You can now run the scripts in Docker container.

	**Example:**

	```bash
	./cutfront.sh ./videos/presenter1.mp4 00:05:12 ./videos/presenter1-trimmed.mp4
	```

	*Remember to output the file to the mounted folder to see it in your host machine.* 
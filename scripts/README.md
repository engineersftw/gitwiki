# Scripts we use

## 1. `multinorm.sh` - audio normalization of video files

- We use this script to normalize the audio of multiple video files.
- It creates a new folder called `normalized` and puts the rendered file in there.

	**Usage:**

	```bash
$ ./multinorm.sh ./<folder_name>
```

	**Important:** Please replace spaces with underscore in your folder name and file names.(eg. `my_videos` instead of `my videos` and `video_file.mov` instead of `video file.mov`).

- ***Attribution***: Based on [Sayanee Basu's](https://github.com/sayanee) [`norm`](https://github.com/sayanee/build-podcast/blob/master/automation/norm).

## 2. `genthumb.sh` - generate thumbnail from file

- Generates a thumbnail of the video at the time stamp supplied (eg. `00:00:12`)
- Creates a `thumbnail` folder and generates a `jpg` and `png` version of the thumbnail.

**Usage:**

```bash
$ ./genthumb.sh <video_file> <time_stamp>
```

## 3. `splitvideo.sh` - splits the video at the time stamp

- Split and trim the video at the time stamp. Generates a new file.

**Usage:**

```bash
$ ./genthumb.sh <input_file> <time_stamp> <output_file>
```

## 4. `copyts.sh` - copy a `.ts` file to `.mp4` file

**Usage:**

```bash
$ ./copyts.sh ./<folder_name>
```
# Scripts we use

## Audio normalization of video files

### File: `multinorm.sh`

- We use this script to normalize the audio of multiple video files.
- It creates a new folder called `normalized` and puts the rendered file in there.

	**Usage:**

	```bash
$ ./multinorm.sh ./<folder_name>
```

	**Important:** Please replace spaces with underscore in your folder name and file names.(eg. `my_videos` instead of `my videos` and `video_file.mov` instead of `video file.mov`).

- ***Attribution***: Based on [Sayanee Basu's](https://github.com/sayanee) [`norm`](https://github.com/sayanee/build-podcast/blob/master/automation/norm).
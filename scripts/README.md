# Scripts we use

## Audio normalization of video files

### File: `multinorm.sh`

- We use this script to normalize the audio of multiple video files.
- It creates a new folder called `normalized` and puts the rendered file in there.

	**Usage:**

	```bash
$ ./multinorm.sh ./<folder_name>
```

- ***Attribution***: Based on [Sayanee Basu's](https://github.com/sayanee) [`norm`](https://github.com/sayanee/build-podcast/blob/master/automation/norm).
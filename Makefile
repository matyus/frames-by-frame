seek:
	ffmpeg -ss ${TIME} -i ${shell pwd}/public/${FILE} -s ${SIZE} -an -vframes 1 ${shell pwd}/tmp/snapshots/${FILE}-${TIME}-%05d.jpg

framerate:
	ffprobe -v 0 -of csv=p=0 -select_streams 0 -show_entries stream=r_frame_rate ./source/${FILE}

dimensions:
	ffprobe -v error -show_entries stream=width,height -of csv=p=0:s=x ./source/${FILE}

clean:
	rm tmp/snapshots/*

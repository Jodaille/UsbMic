#!/bin/bash
HOST=192.168.1.9 # IP address of client (VLC)

# Works piping arecord to ffmpeg
#arecord -f cd -D plughw:1,0 | ffmpeg -i - -acodec libmp3lame -ab 32k -ac 1 -f rtp rtp://$HOST:1234??pkt_size=188?buffer_size=16384


# ffmpeg with libmp3lame
#ffmpeg -thread_queue_size 512 -f alsa -ac 1 -ar 44100 -i hw:1,0 -acodec libmp3lame -map 0:a  -f rtp "rtp://$HOST:1234?pkt_size=188&buffer_size=16384"

# ffmpeg with libopus (need sdp file)
ffmpeg -thread_queue_size 512 -f alsa -ac 1 -ar 44100 -i hw:1,0 -acodec libopus -b:a 44K -map 0:a  -f rtp "rtp://$HOST:1234?pkt_size=188&buffer_size=16384"

## could not manage to stream audio + video with rtp
#ffmpeg  -f alsa -ac 1 -thread_queue_size 512 -ar 44100 -i hw:1,0 -i rtsp://admin:admin@192.168.1.202/1 -framerate 10 -map 0:a -map 1:v -tune zerolatency -preset ultrafast -f mpegts udp://192.168.1.9:2000

# ffmpeg configure on Orange Pi Pc+ ARM
#./configure --enable-libopus --enable-libmp3lame --enable-libtwolame --enable-libass  --enable-libfdk-aac  --enable-libfreetype --enable-libtheora --enable-libvorbis  --enable-libvpx  --enable-libx264  --enable-nonfree --enable-gpl
# make -j4

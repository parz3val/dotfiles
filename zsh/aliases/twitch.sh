stream_twitch() {
  INRES = "1920x1080"
  OUTRES = "1280x720"
  FPS = "30" # target FPS
  GOP = "60" # i-frame interval,
  should be double of FPS
  GOPMIN = "30" # min i-frame interval, should be equal to fps,
  THREADS = "2" # max 6
  CBR = "2500k" # constant bitrate (should be between 1000k - 3000k)
  QUALITY = "ultrafast" # one of the many FFMPEG preset
  AUDIO_RATE = "44100"
  STREAM_KEY = "$1"
  # twitch europe server
  SERVER = "live-fra" # twitch server in frankfurt, 
  

}

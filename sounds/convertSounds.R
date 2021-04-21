### convert.R
###
### Convert WAV files to MP3 using ffmpeg and libmp3lame

outdir = file.path("..", "export", "sounds")
if (!dir.exists(outdir)) dir.create(path = outdir, recursive = TRUE)

wavFiles = list.files(pattern = "[.]wav$")

mp3Files = file.path(
  outdir,
  gsub(pattern = "[.]wav$", replacement = ".mp3", x = wavFiles))

for (i in seq_along(wavFiles)) {
  system2(
    command = "ffmpeg",
    args = c("-i", wavFiles[i], 
             "-c:a", "libmp3lame", 
             "-b:a", "64k",
             mp3Files[i]))
}

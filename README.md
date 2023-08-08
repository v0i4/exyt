# exyt
simple elixir wrapper for the great yt-dlp:
https://github.com/yt-dlp/yt-dlp

pre-requisites:
setup and install yt-dlp in your system:
https://github.com/yt-dlp/yt-dlp/wiki/Installation

how to use:

check installation:
iex> Exyt.check_setup()
"Installed yt-dlp version: 2023.07.06\n"

 iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
 iex> Exyt.download(url, %{output: "/tmp/test/", format: "mp4", quality: :fhd})

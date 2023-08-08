# exyt
simple elixir wrapper for the great yt-dlp:\n
https://github.com/yt-dlp/yt-dlp\n
\n
pre-requisites:\n
setup and install yt-dlp in your system:\n
https://github.com/yt-dlp/yt-dlp/wiki/Installation\n
\n
how to use:\n
\n
check installation:\n
iex> Exyt.check_setup()\n
"Installed yt-dlp version: 2023.07.06\n"\n

 iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"\n
 iex> Exyt.download(url, %{output: "/tmp/test/", format: "mp4", quality: :fhd})\n

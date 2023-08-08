# exyt
simple elixir wrapper for the great yt-dlp:\
`https://github.com/yt-dlp/yt-dlp`
\
pre-requisites:\
setup and install yt-dlp in your system:\
`https://github.com/yt-dlp/yt-dlp/wiki/Installation`
\
how to use:\
\
check installation:\
`iex> Exyt.check_setup()`<br>
`"Installed yt-dlp version: 2023.07.06\n"`
\
 `iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc" `<br>
 `iex> Exyt.download(url, %{output: "/tmp/test/", format: "mp4", quality: :fhd})`<br>
 or with default params(best quality available, .webv format, /tmp/exyt/ output)<br>
 `iex> Exyt.download(url)` 
 <br>

 and you can find your downloaded file at: /tmp/exyt/


 TODO:<br>
 -test and add support to windows/mac;<br>
 -test and add support do yt-dlp advanced features;<br>
 -all the rest;<br>
 

# exyt-dlp

docs
https://hexdocs.pm/exyt_dlp/Exyt.html#content

simple **elixir** wrapper for the great **yt-dlp**:  
[https://github.com/yt-dlp/yt-dlp](https://github.com/yt-dlp/yt-dlp)

# pre-requisites:  

setup and install yt-dlp in your system:
  
[https://github.com/yt-dlp/yt-dlp/wiki/Installation](https://github.com/yt-dlp/yt-dlp/wiki/Installation)


# how to use:  
  
check installation: 
 
`iex> Exyt.check_setup()`  
`"Installed yt-dlp version: 2023.07.06\n"`  

`iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"`  
`iex> Exyt.download(url, %{output: "/tmp/test/", format: "mp4", quality: :fhd})`  

or with default params(best quality available, .webv format, /tmp/exyt/ output)  
`iex> Exyt.download(url)`  

 NOTE: :best quality will always return a .webm file.

and you can find your downloaded file at: /tmp/exyt/

                        def download(url, opts \\ %{})                         

Download

url :: valid yotube string opts :: map

options: :quality :: (:hd | :fhd | :qhd | :uhd | :best) NOTE: default is :best
and :best always will generate a webm file., :output :: directory to save
downloaded files :format :: ("webm", "mp4", "m4a")

## Examples

    iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
    iex> Exyt.download(url, %{output: "/tmp/test/", format: "mp4", quality: :fhd})

`"[youtube] Extracting URL: https://www.youtube.com/watch?v=BaW_jenozKc
[youtube] BaW_jenozKc: Downloading webpage [youtube] BaW_jenozKc: Downloading
ios player API JSON [youtube] BaW_jenozKc: Downloading android pla yer API JSON
[youtube] BaW_jenozKc: Downloading m3u8 information [info] BaW_jenozKc:
Downloading 1 format`

TODO:  
-test and add support to windows/mac;  
-test and add support do yt-dlp advanced features(aria);  
-tests;
-all the rest;


```

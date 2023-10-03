# exyt-dlp

Exyt-DLP is a simple Elixir helper/wrapper for the great [yt-dlp](https://github.com/yt-dlp/yt-dlp).

## before start

Before using `exyt-dlp`, make sure you have yt-dlp installed on your system. You can follow the installation instructions [here](https://github.com/yt-dlp/yt-dlp/wiki/Installation).

## documentation

- HexDocs: [Exyt-DLP Documentation](https://hexdocs.pm/exyt_dlp/Exyt.html#content)
- Hex Package: [Exyt-DLP on Hex](https://hex.pm/packages/exyt_dlp)

## installation

To use Exyt-DLP in your Elixir project, add the following line to your `mix.exs` file's dependencies and then run `mix deps.get`:

`{:exyt_dlp, "~> 0.1.2"}`

# how to use:  
  
check installation: 
 
`iex> Exyt.check_setup()`  
`"Installed yt-dlp version: 2023.07.06\n"`  


`iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"`  
`iex> Exyt.download(url, %{output_path: "/tmp/test/", format: "mp4", quality: :fhd})`  

or with default params(best quality available, .webv format, /tmp/exyt/)  
`iex> Exyt.download(url)`  

`iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"`

use as wrapper, using your custom params:

`iex> Exyt.ytdlp(["--get-filename"], url)`

or use as a helper, with some pre-configured options

`iex> Exyt.download(url, %{output_path: "/tmp/test/", format: "mp4", quality: :fhd})`

or default params:

`iex> Exyt.download(url)`

by default the file will be downloaded at `/tmp/exyt/yourfile.webm` with the :best quality available
NOTE: :best quality will always return a .webm file and some filetypes maybe will not be available at YT for given quality/resolution

options: :quality :: (:hd | :fhd | :qhd | :uhd | :best) NOTE: default is :best
and :best always will generate a webm file., :output_path :: directory to save
downloaded files :format :: ("webm", "mp4", "m4a")

    iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
    iex> Exyt.download(url, %{output_path: "/tmp/test/", format: "mp4", quality: :fhd})

# TODO:

-add specific configuration params for audio/video;

-format output list_formats() - we need to get a list of available file_types for url

-test and add support to windows/mac;  

-test and add support do yt-dlp advanced features(aria and etc);

-all the rest;





# exyt-dlp - [docs](https://hexdocs.pm/exyt_dlp/Exyt.html#content)

Simple **Elixir** wrapper for the great [**yt-dlp**](https://github.com/yt-dlp/yt-dlp](https://github.com/yt-dlp/yt-dlp)

# pre-requisites:  

setup and install yt-dlp in your system: [https://github.com/yt-dlp/yt-dlp/wiki/Installation](https://github.com/yt-dlp/yt-dlp/wiki/Installation)


# How to use:  
  
check installation: 
 
`iex> Exyt.check_setup()`  
`"Installed yt-dlp version: 2023.07.06\n"`  

`iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"`  
`iex> Exyt.download(url, %{output_path: "/tmp/test/", format: "mp4", quality: :fhd})`  

or with default params (*best quality available, .webv format, /tmp/exyt/*)  

`iex> Exyt.download(url)`  

NOTE: **best** quality will always return a `.webm` file.

and you can find your downloaded file at: /tmp/exyt/

```elixir
def download(url, opts \\ %{})
```

# Args

- `url` :: a valid Youtube string
- `options` :: Elixir map %{quality:, :output_path, :format}


- `:quality` :: (:hd | :fhd | :qhd | :uhd | :best)
- `:output_path` :: directory to save downloaded files
- `:format` :: ("webm", "mp4", "m4a")

NOTE: default is :best and :best always will generate a `.webm` file.

## Examples

    iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
    iex> Exyt.download(url, %{output_path: "/tmp/test/", format: "mp4", quality: :fhd})

```
[youtube] Extracting URL: https://www.youtube.com/watch?v=BaW_jenozKc
[youtube] BaW_jenozKc: Downloading webpage [youtube] BaW_jenozKc: Downloading
ios player API JSON [youtube] BaW_jenozKc: Downloading android pla yer API JSON
[youtube] BaW_jenozKc: Downloading m3u8 information [info] BaW_jenozKc:
Downloading 1 format
```

### TODO:  

- test and add support to windows/mac;  
- test and add support do yt-dlp advanced features(aria);  
- format output list_formats()
### THIS REPO WAS MOVED TO [CODEBERG](https://codeberg.org/v0i4/exyt-dlp)
# exyt-dlp - [docs](https://hexdocs.pm/exyt_dlp/Exyt.html#content)
## exyt-dlp - [docs](https://hexdocs.pm/exyt_dlp/Exyt.html#content)
simple **Elixir** wrapper for the great [**yt-dlp**](https://github.com/yt-dlp/yt-dlp)

## usage
all options available to yt-dlp can be passed as as keywords lists:

```
#sync
options = ["extract-audio", "audio-format": "mp3"]
iex> Exyt.download("https://www.youtube.com/watch?v=bWXazVhlyxQ", options)
{:ok, filename}

#async
options = ["extract-audio", "audio-format": "mp3"]
iex> Exyt.download("https://www.youtube.com/watch?v=bWXazVhlyxQ", options, :async)
{:ok, PID}

```


## pre-requisites:  
setup and install yt-dlp in your system: [instructions](https://github.com/yt-dlp/yt-dlp/wiki/Installation)

## install:  
1. add `{:exyt_dlp, "~> 0.1.5"}` to your mix.exs file;
2. mix deps.get
3. check if everything is up and running:
```
iex> Exyt.check_setup
"Installed yt-dlp version: 2024.07.16\n"

```

3. take a look at [complete documentation and list of available functions](https://hexdocs.pm/exyt_dlp/Exyt.html#content) with usage examples.

## contributing
1. fork the repo
2. create your feature branch (`git checkout -b feature/branch`)
3. commit your changes (`git commit -am added feature x`)
4. push to the branch (`git push origin feature/branch`)
5. create a new pull request

defmodule Exyt do
  alias Requirements
  alias Media

  @moduledoc """
  Documentation for `Exyt`.
  """

  @doc """
  check_setup

  ## Examples

      iex> Exyt.check_setup()
      "Installed yt-dlp version: 2023.07.06\n"v
  """

  def check_setup do
    Requirements.check_setup()
  end

  @doc """
    Download

  url :: valid yotube string
  opts :: map

    options:
    :quality :: (:hd | :fhd | :qhd | :uhd | :best),
    :output :: directory to save downloaded files
    :format :: ("webm", "mp4", "m4a")

  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.download(url, %{output: "/tmp/test/", format: "mp4", quality: :fhd})
  "[youtube] Extracting URL: https://www.youtube.com/watch?v=BaW_jenozKc\n[youtube] BaW_jenozKc: Downloading webpage\n[youtube] BaW_jenozKc: Downloading ios player API JSON\n[youtube] BaW_jenozKc: Downloading android pla
  yer API JSON\n[youtube] BaW_jenozKc: Downloading m3u8 information\n[info] BaW_jenozKc: Downloading 1 format(s): 22\n[download] Destination: /tmp/test/youtube-dl test video ＂'⧸⧹ä↭𝕐 [BaW_jenozKc].mp4\n\r[download]   0.5
  % of  214.60KiB at  Unknown B/s ETA Unknown\r[download]   1.4% of  214.60KiB at  993.83KiB/s ETA 00:00  \r[download]   3.3% of  214.60KiB at  147.93KiB/s ETA 00:01\r[download]   7.0% of  214.60KiB at  240.43KiB/s ETA 0
  0:00\r[download]  14.4% of  214.60KiB at  287.45KiB/s ETA 00:00\r[download]  29.4% of  214.60KiB at  327.89KiB/s ETA 00:00\r[download]  59.2% of  214.60KiB at  407.13KiB/s ETA 00:00\r[download] 100.0% of  214.60KiB at
  399.48KiB/s ETA 00:00\r[download] 100% of  214.60KiB in 00:00:01 at 107.33KiB/s \n"
  """

  def download(url, opts \\ %{}) do
    Media.download(url, opts)
  end

  def get_duration(url) do
    Media.get_duration(url)
  end

  def list_formats(url) do
    Media.list_formats(url)
  end

  def get_title(url) do
    Media.get_title(url)
  end
end

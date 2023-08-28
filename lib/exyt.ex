defmodule Exyt do
  alias Exyt.Requirements
  alias Exyt.Media

  @moduledoc """
  Documentation for `Exyt`.
  """

  @doc """
  check_setup

  ## Examples

      iex> Exyt.check_setup()
  """

  def check_setup do
    Requirements.check_setup()
  end

  @doc """
    Download

  url :: valid yotube string
  opts :: map

    options:
    :quality :: (:hd | :fhd | :qhd | :uhd | :best) NOTE: default is :best and :best always will generate a webm file.,
    :output :: directory to save downloaded files
    :format :: ("webm", "mp4", "m4a")

  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.download(url, %{output: "/tmp/test/", format: "mp4", quality: :fhd})
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

  def get_description(url) do
    Media.get_description(url)
  end

  def get_filename(url) do
    Media.get_filename(url)
  end

  def get_format(url) do
    Media.get_format(url)
  end

  def get_id(url) do
    Media.get_id(url)
  end

  def get_thumbnail(url) do
    Media.get_thumbnail(url)
  end

  def get_url(url) do
    Media.get_url(url)
  end

  def download_getting_filename(url, opts \\ %{}) do
    Media.download_getting_filename(url, opts)
  end

  @doc """
  call ytdlp with custom params

  ## Examples

      iex> Exyt.ytdlp(["--get-filename"], "https://www.youtube.com/watch?v=BaW_jenozKc")
  """
  def ytdlp(params, url) do
    Media.ytdlp(params, url)
  end
end

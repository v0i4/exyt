defmodule Exyt.Media do
  alias Exyt.YTdlp
  alias Exyt.Settings

  def download_getting_filename(url, opts \\ %{}) do
    quality = opts |> Map.get(:quality) || :best
    output_path = opts |> Map.get(:output) || "/tmp/exyt/"
    format = opts |> Map.get(:format) || "webm"

    ["-f #{Settings.quality(quality)} #{format}", "-P #{output_path}", url]
    |> YTdlp.call_returning_filepath()
  end

  def download(url, opts \\ %{}) do
    quality = opts |> Map.get(:quality) || :best
    output_path = opts |> Map.get(:output) || "/tmp/exyt/"
    format = opts |> Map.get(:format) || "webm"

    ["-f #{Settings.quality(quality)} #{format}", "-P #{output_path}", url]
    |> YTdlp.call()
  end

  def get_duration(url) do
    ["--get-duration", url]
    |> YTdlp.call()
  end

  def list_formats(url) do
    ["--list-formats", url]
    |> YTdlp.call()
  end

  def get_title(url) do
    ["--get-title", url]
    |> YTdlp.call()
  end

  def get_description(url) do
    ["--get-description", url]
    |> YTdlp.call()
  end

  def get_filename(url) do
    ["--get-filename", url]
    |> YTdlp.call()
  end

  def get_format(url) do
    ["--get-format", url]
    |> YTdlp.call()
  end

  def get_id(url) do
    ["--get-id", url]
    |> YTdlp.call()
  end

  def get_thumbnail(url) do
    ["--get-thumbnail", url]
    |> YTdlp.call()
  end

  def get_url(url) do
    ["--get-url", url]
    |> YTdlp.call()
  end
end

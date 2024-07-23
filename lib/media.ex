defmodule Exyt.Media do
  alias Exyt.YTdlp

  def download(url, opts \\ []) do
    params(url, opts)
    |> YTdlp.call_returning_filepath()
  end

  def get_duration(url) do
    ["--get-duration", url]
    |> YTdlp.call()
  end

  def list_formats(url) do
    ["--list-formats", url]
    |> YTdlp.call_formatting_output()
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

  def ytdlp(params, url) do
    (params ++ [url])
    |> YTdlp.call()
  end

  defp params(url, opts) when is_list(opts) do
    options =
      opts
      |> Enum.reduce([], fn
        {k, v}, acc -> acc ++ ["--#{k}", v]
        arg, acc -> ["--#{arg}" | acc]
      end)

    options ++ [url]
  end
end

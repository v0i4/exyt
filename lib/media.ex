defmodule Media do
  alias YTdlp
  alias Config

  def download(url, opts \\ %{}) do
    quality = opts |> Map.get(:quality) || :best
    output_path = opts |> Map.get(:output) || "/tmp/"
    format = opts |> Map.get(:format) || "webm"

    ["-f #{Config.quality(quality)} #{format}", "-P #{output_path}", url]
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
end

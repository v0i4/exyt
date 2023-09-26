defmodule Exyt.URL do
  @url_regex ~r{^(https?://)?(www\.)?(youtube\.com|youtu\.?be)/(watch\?v=|embed/|v/)?([^&?/]+)}

  def validate(url) do
    case Regex.match?(@url_regex, url) do
      true ->
        {:ok, url}

      false ->
        {:error, :invalid_youtube_url}
    end
  end

  def is_valid?(url) do
    if Regex.match?(@url_regex, url), do: true, else: false
  end
end

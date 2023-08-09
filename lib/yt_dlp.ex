defmodule YTdlp do
  def call(params) do
    cmd = "yt-dlp"

    case System.cmd(cmd, params) do
      {output, 0} ->
        [filename] = String.trim(output) |> String.split("\n")
        {:ok, filename}

      {output, exit_code} ->
        {:error, "Failed to download video. Exit code: #{exit_code}. Output: #{output}"}
    end
  end
end

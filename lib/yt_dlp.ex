defmodule Exyt.YTdlp do
  def call(params) do
    cmd = "yt-dlp"

    {output_path, status_code} = System.cmd(cmd, params)

    case status_code do
      0 -> {:ok, output_path}
      _ -> {:error, :invalid_youtube_url_or_params}
    end
  end

  def call(params, :return_filepath) do
    cmd = "yt-dlp"

    {filepath, _status_get_name} = System.cmd(cmd, params ++ ["--get-filename"])

    {_output_path, status_code} = System.cmd(cmd, params)

    case {status_code, filepath} do
      {0, filepath} ->
        [filename] = String.trim(filepath) |> String.split("\n")

        {:ok, filename}

      _ ->
        {:error, :invalid_youtube_url_or_params}
    end
  end

  def call(params, :stdout_to_list) do
    cmd = "yt-dlp"

    {output_path, status_code} = System.cmd(cmd, params ++ ["--quiet"], into: [], lines: 1024)

    case status_code do
      0 -> {:ok, output_path}
      _ -> {:error, :invalid_youtube_url_or_params}
    end
  end
end

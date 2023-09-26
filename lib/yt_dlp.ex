defmodule Exyt.YTdlp do
  def call(params) do
    cmd = "yt-dlp"

    {output_path, status_code} = System.cmd(cmd, params)

    case status_code do
      0 -> {:ok, output_path}
      1 -> {:error, output_path}
      _ -> {:error, output_path}
    end
  end

  def call_returning_filepath(params) do
    cmd = "yt-dlp"

    {filepath, _status_get_name} = System.cmd(cmd, params ++ ["--get-filename"])

    {output_path, status_code} = System.cmd(cmd, params)

    case {status_code, filepath} do
      {0, filepath} ->
        [filename] = String.trim(filepath) |> String.split("\n")

        {:ok, filename}

      _ ->
        {:error, output_path}
    end
  end
end

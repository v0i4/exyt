defmodule Requirements do
  def check_setup do
    cmd = "yt-dlp"
    params = ["--version"]

    {output, cmd_exit} =
      try do
        System.cmd(cmd, params)
      rescue
        _ ->
          {nil, 1}
      end

    case cmd_exit do
      0 ->
        "Installed yt-dlp version: #{output}"

      1 ->
        "There some issue with your yt-dlp setup, please follow the instructions - https://github.com/yt-dlp/yt-dlp/wiki/Installation"
    end
  end
end

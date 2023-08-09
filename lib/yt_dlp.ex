defmodule YTdlp do
  def call(params) do
    cmd = "yt-dlp"

    {output, _cmd_output} = System.cmd(cmd, params)
    output
  end
end

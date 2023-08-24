defmodule Exyt.Settings do
  def quality(resolution \\ :fhd) do
    case resolution do
      :best ->
        "bv*+ba/b"

      :hd ->
        "'bv*[height=720]+ba'"

      :fhd ->
        "'bv*[height=1080]+ba'"

      :qhd ->
        "'bv*[height=1440]+ba'"

      :uhd ->
        "'bv*[height=2160]+ba'"
    end
  end
end

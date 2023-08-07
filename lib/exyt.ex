defmodule Exyt do
  alias Requirements
  alias Media

  @moduledoc """
  Documentation for `Exyt`.
  """

  @doc """
  check_setup

  ## Examples

      iex> Exyt.check_setup()
      "Installed yt-dlp version: 2023.07.06\n"

  """

  def check_setup do
    Requirements.check_setup()
  end

  def download(url) do
    Media.download(url)
  end
end

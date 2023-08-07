defmodule Media do
  alias Core
  alias Config

  def download(url) do
    params = ["-f", Config.quality(), url]
    Core.call(params)
  end
end

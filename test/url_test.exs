defmodule UrlTest do
  use ExUnit.Case, async: true

  alias Exyt.URL

  @url "https://www.youtube.com/watch?v=BaW_jenozKc"
  @bad_yt_url "https://yt.com"

  test "validate URL returning tuple" do
    assert {:ok, @url} = @url |> URL.validate()
    assert {:error, :invalid_youtube_url} = @bad_yt_url |> URL.validate()
  end

  test "check URL returning a boolean" do
    assert true == @url |> URL.is_valid?()
    assert false == @bad_yt_url |> URL.is_valid?()
  end
end

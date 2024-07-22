defmodule ExytTest do
  use ExUnit.Case, async: true
  doctest Exyt

  @url "https://www.youtube.com/watch?v=BaW_jenozKc"
  @opts []

  test "download" do
    {status, result} = Exyt.download(@url, @opts)

    assert result =~ "youtube-dl test video ＂'⧸⧹ä↭𝕐 [BaW_jenozKc].mp4"
    assert status == :ok
  end

  test "get_duration" do
    {status, result} = Exyt.get_duration(@url)

    assert status == :ok
    assert result == 10
  end

  test "list_formats" do
    {status, result} = Exyt.list_formats(@url)

    assert is_list(result)
    assert status == :ok
  end

  test "get_title" do
    {status, result} = Exyt.get_title(@url)

    assert result == "youtube-dl test video \"'/\\ä↭𝕐\n"

    assert status == :ok
  end

  test "get_filename" do
    {status, result} = Exyt.get_filename(@url)

    assert result =~
             "youtube-dl test video ＂'⧸⧹ä↭𝕐 [BaW_jenozKc].mp4\n"

    assert status == :ok
  end

  test "get_description" do
    {status, result} = Exyt.get_description(@url)

    assert result =~
             "This is a test video for youtube-dl"

    assert status == :ok
  end

  test "get_thumbnail" do
    {status, result} = Exyt.get_thumbnail(@url)

    assert result ==
             "https://i.ytimg.com/vi/BaW_jenozKc/maxresdefault.jpg\n"

    assert status == :ok
  end

  test "get_format" do
    {status, result} = Exyt.get_format(@url)

    assert result =~ "1080"

    assert status == :ok
  end

  test "get_id" do
    {status, result} = Exyt.get_id(@url)

    assert result ==
             "BaW_jenozKc\n"

    assert status == :ok
  end

  test "get_url" do
    {status, result} = Exyt.get_url(@url)

    assert result =~
             "https://"

    assert status == :ok
  end

  test "download_getting_filename" do
    {status, result} = Exyt.download(@url, @opts)

    assert result =~
             "youtube-dl test video ＂'⧸⧹ä↭𝕐 [BaW_jenozKc].mp4"

    assert status == :ok
  end

  test "ytdlp" do
    params = ["--get-id"]
    {status, result} = Exyt.ytdlp(params, @url)

    assert result =~
             "BaW_jenozKc\n"

    assert status == :ok
  end
end

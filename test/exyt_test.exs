defmodule ExytTest do
  use ExUnit.Case, async: true
  doctest Exyt

  alias Caller

  import Mox

  setup :verify_on_exit!

  @url "https://www.youtube.com/watch?v=BaW_jenozKc"
  @opts []

  test "download" do
    expect(ExytBehaviourMock, :download, fn _url, _opts ->
      {:ok, "youtube-dl test video \"'/\\ä↭𝕐\n"}
    end)

    assert {:ok, _} = Caller.download(@url, @opts)
  end

  test "async download" do
    expect(ExytBehaviourMock, :download, fn _url, _opts, :async ->
      {:ok, spawn(fn -> :async end)}
    end)

    assert {:ok, pid} = Caller.download(@url, @opts, :async)
    assert is_pid(pid)
  end

  test "get_duration" do
    expect(ExytBehaviourMock, :get_duration, fn _url ->
      {:ok, "10\n"}
    end)

    assert {:ok, "10\n"} =
             Caller.get_duration(@url)
  end

  test "list_formats" do
    expect(ExytBehaviourMock, :list_formats, fn _url ->
      {:ok, ["mp4"]}
    end)

    {status, result} = Caller.list_formats(@url)

    assert is_list(result)
    assert status == :ok
  end

  test "get_title" do
    expect(ExytBehaviourMock, :get_title, fn _url ->
      {:ok, "youtube-dl test video \"'/\\ä↭𝕐\n"}
    end)

    {status, result} = Caller.get_title(@url)

    assert result == "youtube-dl test video \"'/\\ä↭𝕐\n"
    assert status == :ok
  end

  test "get_filename" do
    expect(ExytBehaviourMock, :get_filename, fn _url ->
      {:ok, "youtube-dl test video \"'/\\ä↭𝕐 [BaW_jenozKc].mp4\n"}
    end)

    {status, result} = Caller.get_filename(@url)

    assert result =~
             "youtube-dl test video"

    assert status == :ok
  end

  test "get_description" do
    expect(ExytBehaviourMock, :get_description, fn _url ->
      {:ok, "This is a test video for youtube-dl\n"}
    end)

    {status, result} = Caller.get_description(@url)

    assert result =~
             "This is a test video for youtube-dl"

    assert status == :ok
  end

  test "get_thumbnail" do
    expect(ExytBehaviourMock, :get_thumbnail, fn _url ->
      {:ok, "https://i.ytimg.com/vi/BaW_jenozKc/maxresdefault.jpg\n"}
    end)

    {status, result} = Caller.get_thumbnail(@url)

    assert result ==
             "https://i.ytimg.com/vi/BaW_jenozKc/maxresdefault.jpg\n"

    assert status == :ok
  end

  test "get_format" do
    expect(ExytBehaviourMock, :get_format, fn _url ->
      {:ok, "1080\n"}
    end)

    {status, result} = Caller.get_format(@url)

    assert result =~ "1080"

    assert status == :ok
  end

  test "get_id" do
    expect(ExytBehaviourMock, :get_id, fn _url ->
      {:ok, "BaW_jenozKc\n"}
    end)

    {status, result} = Caller.get_id(@url)

    assert result ==
             "BaW_jenozKc\n"

    assert status == :ok
  end

  test "get_url" do
    expect(ExytBehaviourMock, :get_url, fn _url ->
      {:ok, "https://www.youtube.com/watch?v=BaW_jenozKc\n"}
    end)

    {status, result} = Caller.get_url(@url)

    assert result =~
             "https://"

    assert status == :ok
  end

  test "ytdlp" do
    params = ["--get-id"]

    expect(ExytBehaviourMock, :ytdlp, fn _params, @url ->
      {:ok, "BaW_jenozKc\n"}
    end)

    {status, result} = Caller.ytdlp(params, @url)

    assert result =~
             "BaW_jenozKc\n"

    assert status == :ok
  end
end

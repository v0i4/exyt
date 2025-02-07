defmodule Caller do
  def download(url, opts, :async) do
    impl().download(url, opts, :async)
  end

  def download(url, opts) do
    impl().download(url, opts)
  end

  def get_duration(url) do
    impl().get_duration(url)
  end

  def list_formats(url) do
    impl().list_formats(url)
  end

  def get_title(url) do
    impl().get_title(url)
  end

  def get_filename(url) do
    impl().get_filename(url)
  end

  def get_description(url) do
    impl().get_description(url)
  end

  def get_thumbnail(url) do
    impl().get_thumbnail(url)
  end

  def get_format(url) do
    impl().get_format(url)
  end

  def get_id(url) do
    impl().get_id(url)
  end

  def get_url(url) do
    impl().get_url(url)
  end

  def ytdlp(params, url) do
    impl().ytdlp(params, url)
  end

  defp impl() do
    Application.get_env(:exyt_dlp, :exyt_mock, Exyt)
  end
end

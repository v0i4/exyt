defmodule Exyt do
  alias Exyt.Requirements
  alias Exyt.Media
  alias Exyt.URL

  @moduledoc """
  Documentation for `Exyt`.
  Wrapper / helper to download media from YT
  """

  @doc """
  check_setup

  ## Examples

      iex> Exyt.check_setup()

  """

  def check_setup do
    Requirements.check_setup()
  end

  @doc """
  call ytdlp with custom params

  ## Examples

      iex> Exyt.ytdlp(["--get-filename"], "https://www.youtube.com/watch?v=BaW_jenozKc")
  """
  def ytdlp(params, url) do
    Media.ytdlp(params, url)
  end

  @doc """
  Validates a URL string to check if it's a valid YouTube URL.


  ## Parameters


      -`url` (string): A URL string to be validated.

  ## Returns

      A tuple representing the validation result:
    - `{:ok, valid_url}` (tuple): If the URL is a valid YouTube URL.
    - `{:error, :invalid_youtube_url}` (tuple): If the URL is not a valid YouTube URL.

  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.validate_url(url)
  """
  def validate_url(url) do
    url |> URL.validate()
  end

  @doc """
  Checks if a URL string is valid.

  ## Parameters

      `url` (string): A URL string to be checked for validity.

  ## Returns

      A boolean indicating whether the URL is valid (true) or not (false).

  ## Examples

      iex> valid_url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.is_valid_url?(valid_url)
      true

  """
  def is_valid_url?(url) do
    url |> URL.is_valid?()
  end

  def download(url, opts \\ [])

  @doc """
  Downloads a media file from a valid YouTube URL.

  ## Parameters

      `url` (string): A valid YouTube URL.
      `opts` (list): YT-DLP default arguments.


  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> options = ["format=mp4", "output=video.mp4"]
      iex> Exyt.download(url, options)
      iex> {:ok, _filename} = Exyt.download(url, options)

  ## Returns

      A tuple with two elements:
      - `:status_request` (atom): The status of the request (:ok or :error).
      - `:string_media_filename` (string): The filename of the media file.


  """

  def download(url, opts) do
    Media.download(url, opts)
  end

  @doc """
  Downloads asyncronously a media file from a valid YouTube URL.

  ## Parameters

      `url` (string): A valid YouTube URL.
      `opts` (list): YT-DLP default arguments.
      `:async`(atom): Asynchronous downloading


  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> options = ["format=mp4", "output=video.mp4"]
      iex> {:ok, _PID} = Exyt.download(url, options, :async)

  ## Returns

      A tuple with two elements:
      - `:status_request` (atom): The status of the request (:ok or :error).
      - `PID` (PID): The PID of async downloading task


  """

  def download(url, opts, :async) do
    Task.start_link(fn ->
      Media.download(url, opts)
    end)
  end

  @doc """
  Retrieves the duration of a media file from the given URL.

  ## Parameters

      `url` (string): A URL string pointing to a media file.

  ## Returns

      A tuple with two elements:
      - `:status_request` (atom): The status of the request (:ok or :error).
      - `:duration_in_seconds` (number): The duration of the media file in seconds.

  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.get_duration(url)

  """

  def get_duration(url) do
    url
    |> Media.get_duration()
  end

  @doc """
   Retrieves the list of available formats of a media file from the given URL.

   ## Parameters

       `url` (string): A valid YouTube URL.

   ## Returns

       A tuple with two elements:
       - `:status_request` (atom): The status of the request (:ok or :error).
       - `:list_of_formats` (list): Formatted stdout  from `yt-dlp --list-formats` into a list. 

  """

  def list_formats(url) do
    Media.list_formats(url)
  end

  @doc """
  Retrieves the title of a media file from the given URL.

  ## Parameters

      `url` (string): A URL string pointing to a media file.

  ## Returns

      A tuple with two elements:
      - `:status_request` (atom): The status of the request (:ok or :error).
      - `:string_media_title` (string): The title of the media file.

  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.get_title(url)

  """

  def get_title(url) do
    Media.get_title(url)
  end

  @doc """
  Retrieves the description of a media file from the given URL.

  ## Parameters

      `url` (string): A URL string pointing to a media file.

  ## Returns

      A tuple with two elements:
      - `:status_request` (atom): The status of the request (:ok or :error).
      - `:string_media_description` (string): The description of the media file.

  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.get_description(url)

  """
  def get_description(url) do
    Media.get_description(url)
  end

  @doc """
  Retrieves the filename of a media file from the given URL.

  ## Parameters

      `url` (string): A URL string pointing to a media file.

  ## Returns

      A tuple with two elements:
      - `:status_request` (atom): The status of the request (:ok or :error).
      - `:string_media_filename` (string): The filename of the media file.

  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.get_filename(url)

  """
  def get_filename(url) do
    Media.get_filename(url)
  end

  @doc """
  Retrieves the format of a media file from the given URL.

  ## Parameters

      `url` (string): A URL string pointing to a media file.

  ## Returns

      A tuple with two elements:
      - `:status_request` (atom): The status of the request (:ok or :error).
      - `:string_media_format` (string): The format of the media file.

  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.get_format(url)

  """
  def get_format(url) do
    Media.get_format(url)
  end

  @doc """
  Retrieves the ID of a media file from the given URL.

  ## Parameters

      `url` (string): A URL string pointing to a media file.

  ## Returns

      A tuple with two elements:
      - `:status_request` (atom): The status of the request (:ok or :error).
      - `:string_media_id` (string): The ID of the media file.

  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.get_id(url)

  """
  def get_id(url) do
    Media.get_id(url)
  end

  @doc """
  Retrieves the thumbnail URL of a media file from the given URL.

  ## Parameters

      `url` (string): A URL string pointing to a media file.

  ## Returns

      A tuple with two elements:
      - `:status_request` (atom): The status of the request (:ok or :error).
      - `:string_thumbnail_url` (string): The URL of the media file's thumbnail.

  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.get_thumbnail(url)

  """
  def get_thumbnail(url) do
    Media.get_thumbnail(url)
  end

  @doc """
  Retrieves the media URL from the given URL.

  ## Parameters

      `url` (string): A URL string pointing to a media file.

  ## Returns

      A tuple with two elements:
      - `:status_request` (atom): The status of the request (:ok or :error).
      - `:string_media_url` (string): The URL of the media file.

  ## Examples

      iex> url = "https://www.youtube.com/watch?v=BaW_jenozKc"
      iex> Exyt.get_url(url)

  """
  def get_url(url) do
    Media.get_url(url)
  end
end

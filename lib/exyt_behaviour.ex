defmodule ExytBehaviour do
  @callback download(url :: String.t(), opts :: Keyword.t(), :async) :: {atom(), String.t()}
  @callback download(url :: String.t(), opts :: Keyword.t()) :: {atom(), String.t()}
  @callback get_duration(url :: String.t()) :: {atom(), String.t()}
  @callback list_formats(url :: String.t()) :: {atom(), list()}
  @callback get_title(url :: String.t()) :: {atom(), String.t()}
  @callback get_filename(url :: String.t()) :: {atom(), String.t()}
  @callback get_description(url :: String.t()) :: {atom(), String.t()}
  @callback get_thumbnail(url :: String.t()) :: {atom(), String.t()}
  @callback get_format(url :: String.t()) :: {atom(), String.t()}
  @callback get_id(url :: String.t()) :: {atom(), String.t()}
  @callback get_url(url :: String.t()) :: {atom(), String.t()}
  @callback ytdlp(params :: list(), url :: String.t()) :: {atom(), String.t()}
end

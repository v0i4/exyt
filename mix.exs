defmodule Exyt.MixProject do
  use Mix.Project

  def project do
    [
      app: :exyt_dlp,
      version: "0.1.3",
      description: "simple elixir helper/wrapper for downloading youtube videos using YT-DLP",
      elixir: "~> 1.14",
      name: :exyt_dlp,
      package: %{
        licenses: ["Apache-2.0"],
        links: %{"codeberg" => "https://codeberg.org/v0i4/exyt-dlp"}
      },
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.30.5", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end

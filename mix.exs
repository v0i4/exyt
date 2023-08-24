defmodule Exyt.MixProject do
  use Mix.Project

  def project do
    [
      app: :exyt,
      version: "0.1.0",
      description: "simple elixir wrapper for YT-DLP",
      elixir: "~> 1.14",
      name: :exyt_dlp,
      package: %{
        licenses: ["Apache-2.0"],
        links: %{"github" => "https://github.com/v0i4/exyt"}
      },
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end

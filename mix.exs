defmodule Filtrex.Mixfile do
  use Mix.Project

  def project do
    [app: :filtrex,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     elixirc_paths: elixirc_paths(Mix.env),
     deps: deps]
  end

  def elixirc_paths(:test), do: ~w(lib test/support)
  def elixirc_paths(_), do: ~w(lib)

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger] ++ applications(Mix.env)]
  end

  def applications(:test), do: [:postgrex, :ecto]
  def applications(_), do: []

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:postgrex, ">= 0.0.0", only: :test},
      {:ecto, "~> 1.1", only: :test}
    ]
  end
end
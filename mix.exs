defmodule ExPidController.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_pid_controller,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Docs
      name: "ex_pid_controller",
      source_url: "https://github.com/ciroque/ex_pid_controller",
      homepage_url: "https://github.com/ciroque/ex_pid_controller",
      # The main page in the docs
      docs: [main: "ExPidController", extras: ["README.md"]]
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
      {:ex_doc, "~> 0.18.3"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end

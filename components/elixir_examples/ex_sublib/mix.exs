defmodule ExSubLib.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_sublib,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: [
        {:jason, "~> 1.2"}
      ]
    ]
  end
end

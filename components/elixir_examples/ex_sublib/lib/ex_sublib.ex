defmodule ExSubLib do
  def hello do
    Jason.encode!(%{hello: "ex_sublib"})
  end
end

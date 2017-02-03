defmodule Blitzy.Caller do
  def start(n, url) do
    this = self()

    1..n
    |> Enum.map(fn _ -> spawn(fn -> Blitzy.Worker.start(url, this) end) end)
    |> Enum.map(fn _ ->
      receive do
        x -> x
      end
    end)
  end
end

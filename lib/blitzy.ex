defmodule Blitzy do
  def run(n) when n > 0 do
    execute = fn -> Blitzy.Worker.start("http://www.bieberfever.com") end

    1..n
    |> Enum.map(fn _ -> Task.async(execute) end)
    |> Enum.map(&Task.await(&1, :infinity))
  end
end

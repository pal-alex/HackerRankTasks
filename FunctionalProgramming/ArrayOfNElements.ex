#Easy #10
defmodule Solution do
  #Enter your code here. Read input from STDIN. Print output to STDOUT
    def max_value(), do: 100

    def list([]), do: []
    def list(n), do: Enum.map(1..n, fn(_) -> :rand.uniform(Solution.max_value()) end)

    def get(), do: IO.gets("") |> Solution.parse

    def parse(v) when is_binary(v), do: Integer.parse(v) |> Solution.parse_int
    def parse_int({v, _}) when v>=1 and v<=100, do: v
    def parse_int(_), do: []

end

n = Solution.get()
l = Solution.list(n)
IO.inspect(l, charlists: :as_lists, limit: :infinity)

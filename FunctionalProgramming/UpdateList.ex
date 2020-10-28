#Easy #10
#https://www.hackerrank.com/challenges/fp-update-list/problem

defmodule Solution do
  #Enter your code here. Read input from STDIN. Print output to STDOUT

    def abs_list(list), do: Enum.map(list, fn(elem) -> Solution.abs(elem) end)
    def abs(value) when value < 0, do: -value
    def abs(value), do: value

    def print([]), do: []
    def print(list), do: Enum.each(list, & IO.puts(&1))

    def get_list(), do: Enum.reverse(get_list([]))
    def get_list(acc) do
        v = Solution.get()
        case v do
            [] -> acc
            _ -> get_list([v|acc])
        end
    end

    def get(), do: IO.gets("") |> Solution.parse

    def parse(v) when is_binary(v), do: Integer.parse(v) |> Solution.parse_int
    def parse(_), do: []
    def parse_int({v, _}) when v>=-100 and v<=100, do: v
    def parse_int(_), do: []

    def test(value) do
        IO.inspect(value, charlist: :as_list, limit: :infinity)
        IO.puts("______")
    end

end

list0 = Solution.get_list()
list = Solution.abs_list(list0)
Solution.print(list)

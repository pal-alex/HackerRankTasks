#Easy #10
#https://www.hackerrank.com/challenges/fp-list-replication/problem

defmodule Solution do
  #Enter your code here. Read input from STDIN. Print output to STDOUT

    def print(n, _list) when n < 1, do: []
    def print(n, list) do
        Enum.each(list, fn ([]) -> []
                            (elem) ->
                              Enum.each(1..n, fn(_) -> IO.puts(elem) end)
                            end)
    end

    def get_list() do
      {list, _} = Enum.reduce(1..10, {[], false},
                            fn(_, {_, true} = acc) -> acc
                              (_, {list, false}) ->
                                      v = Solution.get()
                                      {[v|list], v==[]}
                            end)
      Enum.reverse(list)
    end

    def get(), do: IO.gets("") |> Solution.parse

    def parse(v) when is_binary(v), do: Integer.parse(v) |> Solution.parse_int
    def parse(_), do: []
    def parse_int({v, _}) when v>=1 and v<=100, do: v
    def parse_int(_), do: []

end

n = Solution.get()
list = Solution.get_list()
Solution.print(n, list)

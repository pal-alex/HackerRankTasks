#Easy #10
#https://www.hackerrank.com/challenges/fp-filter-array/problem

defmodule Solution do
  #Enter your code here. Read input from STDIN. Print output to STDOUT


    def filter(x, list), do:
        #Enum.filter(list, & &1 < x)
        Enum.reduce(list, [], fn(elem, acc) when elem < x -> [elem | acc]
                                (_elem, acc) -> acc
                              end) |> Enum.reverse



    def print(list), do: Enum.each(list, & IO.puts(&1))

    def get_list(b) do
      {list, _} = Enum.reduce(1..b, {[], false},
                            fn(_, {_, true} = acc) -> acc
                              (_, {list, false}) ->
                                      v = Solution.get()
                                      case v do
                                        [] -> {list, true}
                                        _ -> {[v|list], false}
                                      end
                            end)
      Enum.reverse(list)
    end

    def get(), do: IO.gets("") |> Solution.parse

    def parse(v) when is_binary(v), do: Integer.parse(v) |> Solution.parse_int
    def parse(_), do: []
    def parse_int({v, _}), do: v
    def parse_int(_), do: []
end

x = Solution.get()
b = 100
list0 = Solution.get_list(b)
list = Solution.filter(x, list0)
Solution.print(list)

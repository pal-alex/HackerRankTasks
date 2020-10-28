#Easy #10
#https://www.hackerrank.com/challenges/fp-filter-positions-in-a-list/problem

defmodule Solution do
  #Enter your code here. Read input from STDIN. Print output to STDOUT


    def filter(list) do
        {res, _} = Enum.reduce(list, {[], 1},
                              fn(elem, {acc, num}) when rem(num, 2)==0 -> {[elem | acc], num + 1}
                                (_elem, {acc, num}) -> {acc, num + 1}
                              end)
        Enum.reverse(res)
    end



    def print(list), do: Enum.each(list, & IO.puts(&1))

    def get_list(), do: get_list([]) |> Enum.reverse
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
    def parse_int({v, _}), do: v
    def parse_int(_), do: []
end

list0 = Solution.get_list()
list = Solution.filter(list0)
Solution.print(list)

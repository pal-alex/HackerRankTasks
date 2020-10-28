#Easy #3
#https://www.hackerrank.com/challenges/fp-solve-me-first/problem

defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
    def get(), do: IO.gets("") |> Solution.parse_int


    def to_num(list), do: Enum.map(list, & Solution.parse_int(&1))
    def parse_float(value), do: Float.parse(value) |> Solution.parse_num
    def parse_int(value), do: Integer.parse(value) |> Solution.parse_num
    def parse_num({v, _}), do: v
    def parse_num(_), do: []
end

a = Solution.get()
b = Solution.get()
c = a+b
IO.puts(c)

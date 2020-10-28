#Easy #2
#https://www.hackerrank.com/challenges/functional-programming-warmups-in-recursion---gcd/problem

defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
    def gcd(_a, 1), do: 1
    def gcd(1, _b), do: 1
    def gcd(a, b) when a == b, do: a
    def gcd(a, b) when a > b, do: Solution.gcd(a - b, b)
    def gcd(a, b), do: Solution.gcd(b - a, a)

    def get(), do: IO.gets("") |> String.split() |> Solution.to_num


    def to_num(list), do: Enum.map(list, & Solution.parse_int(&1))
    def parse_float(value), do: Float.parse(value) |> Solution.parse_num
    def parse_int(value), do: Integer.parse(value) |> Solution.parse_num
    def parse_num({v, _}), do: v
    def parse_num(_), do: []
end

[a, b] = Solution.get()
res = Solution.gcd(a, b)
IO.puts(res)

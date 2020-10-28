#Easy #2
#https://www.hackerrank.com/challenges/functional-programming-warmups-in-recursion---fibonacci-numbers/problem

defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
    def fib(1), do: 0
    def fib(2), do: 1
    def fib(n), do: Solution.fib(n-1) + Solution.fib(n-2)

    def get(), do: IO.gets("") |> Solution.parse_int


    def to_num(list), do: Enum.map(list, & Solution.parse_int(&1))
    def parse_float(value), do: Float.parse(value) |> Solution.parse_num
    def parse_int(value), do: Integer.parse(value) |> Solution.parse_num
    def parse_num({v, _}), do: v
    def parse_num(_), do: []
end

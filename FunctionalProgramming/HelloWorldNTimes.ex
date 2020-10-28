#Easy #5
#https://www.hackerrank.com/challenges/fp-hello-world-n-times/problem

defmodule Solution do
  #Enter your code here. Read input from STDIN. Print output to STDOUT

    def print(n), do: Enum.each(1..n, fn(_) -> IO.puts("Hello World") end)

end

n = IO.gets("") |> String.to_integer()
Solution.print(n)

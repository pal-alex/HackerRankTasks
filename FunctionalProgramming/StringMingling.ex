# Easy
# https://www.hackerrank.com/challenges/string-mingling/problem

defmodule Solution do
  # Enter your code here. Read input from STDIN. Print output to STDOUT
  def get() do
    IO.gets("")
    |> String.trim()
  end

  def mingle(<<a_head, "">>, <<b_head, "">>), do: <<a_head, b_head>>

  def mingle(<<a_head, a_rest::binary>>, <<b_head, b_rest::binary>>) do
    <<a_head, b_head, mingle(a_rest, b_rest)::binary>>
  end
end

a = Solution.get()

b = Solution.get()

IO.puts(Solution.mingle(a, b))

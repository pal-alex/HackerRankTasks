#Easy #20
#https://www.hackerrank.com/challenges/eval-ex/problem

defmodule Solution do

  def exp(x), do: exp(x, 9)
  def exp(_, 0), do: 1
  def exp(x, n), do: Solution.power(x, n)/Solution.fac(n) + Solution.exp(x, n-1)

  def fac(1), do: 1
  def fac(n), do: n*fac(n-1)

  def power(x, 1), do: x
  def power(x, n), do: x*power(x, n-1)


  def print([]), do: []
  def print(list), do: Enum.each(list, & IO.puts(Solution.exp(&1)))

  def get_list(n), do: Enum.map(1..n, fn(_) -> Solution.get(:float) end)


  def get(), do: IO.gets("") |> Solution.parse_int
  def get(:float), do: IO.gets("") |> Solution.parse_float


  def parse_int(v) when is_binary(v), do: Integer.parse(v) |> Solution.parse_num
  def parse_int(_), do: []
  def parse_float(v) when is_binary(v), do: Float.parse(v) |> Solution.parse_num
  def parse_float(_), do: []

  def parse_num({v, _}), do: v
  def parse_num(_), do: []

  def test(value) do
     IO.inspect(value, charlist: :as_list, limit: :infinity)
     IO.puts("______")
  end

end

n = Solution.get()
list = Solution.get_list(n)
Solution.print(list)

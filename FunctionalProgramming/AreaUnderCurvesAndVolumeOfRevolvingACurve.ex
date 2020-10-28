#Easy #30
#https://www.hackerrank.com/challenges/area-under-curves-and-volume-of-revolving-a-curv/problem

defmodule Solution do

  def f(koefs, x), do: Enum.reduce(koefs, 0, fn({a, b}, sum) -> a*:math.pow(x, b) + sum end)

  def square(l, x, delta, koefs) when l < x do
      delta*f(koefs, x) + Solution.square(l, x - delta, delta, koefs)
  end
  def square(_, _, _, _), do: 0

  def volume(l, x, delta, koefs) when l < x do
      y = f(koefs, x)
      delta*:math.pi*:math.pow(y, 2) + Solution.volume(l, x-delta, delta, koefs)
  end
  def volume(_, _, _, _), do: 0

  def handle_lines() do
      lines = Enum.map(IO.stream(:stdio, :line), & String.split(&1))

      koefs = Enum.zip(Solution.to_num(Enum.at(lines, 0)), Solution.to_num(Enum.at(lines, 1)))
      [l, r] = Solution.to_num(Enum.at(lines, 2))
      #IO.inspect(koefs)
      #IO.inspect({l, r})
      delta = 0.001
      s = Solution.square(l, r, delta, koefs)
      IO.inspect(s)
      v = Solution.volume(l, r, delta, koefs)
      IO.inspect(v)
  end

  def to_num(list), do: Enum.map(list, & Solution.parse_float(&1))
  def parse_float(value), do: Float.parse(value) |> Solution.parse_num
  def parse_int(value), do: Integer.parse(value) |> Solution.parse_num
  def parse_num({v, _}), do: v
  def parse_num(_), do: []
end

Solution.handle_lines()

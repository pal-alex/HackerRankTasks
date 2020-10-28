#Easy #15
#https://www.hackerrank.com/challenges/lambda-march-compute-the-perimeter-of-a-polygon/problem

defmodule Solution do

  def perimeter([head|tail]) do
      #IO.inspect(data)
      data = Enum.concat(tail, [head])
      {_, p} = Enum.reduce(data, {head, 0}, fn({x, y}, {{x0, y0}, p0}) ->
                                             l = :math.sqrt(:math.pow((x-x0), 2) + :math.pow((y-y0), 2))
                                             {{x, y}, p0+l}
                                          end)
      IO.puts(p)
  end

  def get_point() do
      IO.gets("")
      |> String.split()
      |> Solution.to_num
      |> List.to_tuple
  end

  def get(), do: IO.gets("") |> Solution.parse_int
  def get_data(t), do: Enum.map(1..t, fn(_) -> Solution.get_point() end)


  def to_num(list), do: Enum.map(list, & Solution.parse_int(&1))
  def parse_float(value), do: Float.parse(value) |> Solution.parse_num
  def parse_int(value), do: Integer.parse(value) |> Solution.parse_num
  def parse_num({v, _}), do: v
  def parse_num(_), do: []
end

t = Solution.get()
data = Solution.get_data(t)
Solution.perimeter(data)

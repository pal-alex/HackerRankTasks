#Easy #20
# https://www.hackerrank.com/challenges/lambda-march-compute-the-area-of-a-polygon/problem

defmodule Solution do

  def square([head|tail]) do
      data = Enum.concat(tail, [head])
      {_, mult_1, mult_2} = Enum.reduce(data, {head, 0, 0},
                              fn({x, y}, {{x0, y0}, m_1, m_2}) ->
                                              s_1 = x*y0
                                              s_2 = y*x0
                                             {{x, y}, m_1+s_1, m_2+s_2}
                                          end)
      s = :erlang.abs(mult_2 - mult_1)/2
      IO.puts(s)
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
Solution.square(data)

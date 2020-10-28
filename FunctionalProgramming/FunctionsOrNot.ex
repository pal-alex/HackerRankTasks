#Easy #5
#https://www.hackerrank.com/challenges/functions-or-not/problem

defmodule Solution do

  def answer(true), do: "YES"
  def answer(false), do: "NO"

  def handle_test(data) do
      {list_x, _} = Enum.unzip(data)
      is_func = Enum.count(list_x) == Enum.count(Enum.uniq(list_x))
      IO.puts(Solution.answer(is_func))
  end



  def handle_data(data), do:
      Enum.each(data, fn({_num, test}) -> Solution.handle_test(test) end)

  def get_test() do
      n = Solution.get()
      tests = Enum.map(1..n, fn(_) ->
                                  IO.gets("")
                                  |> String.split()
                                  |> Solution.to_num
                                  |> List.to_tuple
                              end)
      #IO.inspect(tests)
      tests
  end

  def get(), do: IO.gets("") |> Solution.parse_int


  def to_num(list), do: Enum.map(list, & Solution.parse_int(&1))
  def parse_float(value), do: Float.parse(value) |> Solution.parse_num
  def parse_int(value), do: Integer.parse(value) |> Solution.parse_num
  def parse_num({v, _}), do: v
  def parse_num(_), do: []
end

t = Solution.get()
data = Enum.map(1..t, & {&1, Solution.get_test()})
Solution.handle_data(data)

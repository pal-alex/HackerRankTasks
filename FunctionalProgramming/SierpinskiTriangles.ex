#Advanced #30
#https://www.hackerrank.com/challenges/functions-and-fractals-sierpinski-triangles/problem


defmodule Solution do
  #Enter your code here. Read input from STDIN. Print output to STDOUT

    @rows 32
    @columns 63

    def head(num) when rem(num, 2) == 0, do: div(num, 2)
    def head(num), do: div(num, 2) + 1

    def symbol(true), do: "1"
    def symbol(false), do: "_"

    def is_one?(row_triangles, r, column) do
        Enum.any?(row_triangles, fn({_, start_column, _}) ->
                                      column >= start_column - (r-1)
                                      and column <= start_column + (r-1)
                                end)
    end

    def print(triangles) do

        t = Enum.sort_by(triangles, fn({r, c, _h}) -> {r, c} end)
        {_, _, height} = Enum.at(t, 0)
        t0 = Enum.group_by(t, fn({r, _, _}) -> r end) |> Map.to_list
        #IO.inspect(t0)
        Enum.each(t0, fn({_, row_triangles}) ->
            Enum.each(1..height, fn(r) ->
                Enum.each(1..@columns, fn(column) ->
                                        Solution.is_one?(row_triangles, r, column)
                                        |> Solution.symbol
                                        |> IO.write
                                    end)
                IO.puts("")
            end)

        end)
    end

    def divide(triangles), do:
        Enum.reduce(triangles, [], fn({r, c, h}, acc) ->
                                      h0 = div(h, 2)
                                      [{r, c, h0},
                                        {r+h0, c-h0, h0},
                                        {r+h0, c+h0, h0}] ++ acc
                                    end)


    def serp(0), do: [{1, Solution.head(@columns), @rows}]
    def serp(n), do: Solution.divide(Solution.serp(n-1))



    def get(), do: IO.gets("") |> Solution.parse_int
    def to_num(list), do: Enum.map(list, & Solution.parse_int(&1))
    def parse_float(value), do: Float.parse(value) |> Solution.parse_num
    def parse_int(value), do: Integer.parse(value) |> Solution.parse_num
    def parse_num({v, _}), do: v
    def parse_num(_), do: []
end

n = Solution.get()
triangles = Solution.serp(n)
Solution.print(triangles)

# Easy
# https://www.hackerrank.com/challenges/pascals-triangle/problem

defmodule Solution do
  # Enter your code here. Read input from STDIN. Print output to STDOUT
  def get() do
    IO.gets("")
    |> Solution.parse()
  end

  def pascal(k) do
    Enum.each(0..(k - 1), fn row ->
      FactServer.next_fact(row)

      Enum.map(0..row, fn col ->
        div(FactServer.fact(row), FactServer.fact(col) * FactServer.fact(row - col))
      end)
      |> Enum.join(" ")
      |> IO.puts()
    end)
  end

  def parse(k) when is_binary(k), do: Integer.parse(k) |> Solution.parse_int()
  def parse(_), do: []
  def parse_int({k, _}) when k >= 2 and k <= 10, do: k
  def parse_int(value), do: throw("Invalid input #{inspect(value)}")
end

defmodule FactServer do
  use GenServer

  def start() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def fact(n) do
    GenServer.call(__MODULE__, {:fact, n})
  end

  def next_fact(n) do
    GenServer.call(__MODULE__, {:next_fact, n})
  end

  @impl true
  def init(_) do
    {:ok, %{last_index: 1, last_fact: 1, facts: %{0 => 1, 1 => 1}}}
  end

  @impl true
  def handle_call({:next_fact, n}, _from, state) do
    if n <= state.last_index do
      {:reply, state.facts[n], state}
    else
      new_last_index = state.last_index + 1
      result = state.last_fact * new_last_index

      new_state = %{
        last_index: new_last_index,
        last_fact: result,
        facts: Map.put(state.facts, new_last_index, result)
      }

      {:reply, result, new_state}
    end
  end

  @impl true
  def handle_call({:fact, n}, _from, state) do
    case Map.has_key?(state.facts, n) do
      false ->
        IO.puts("Unexpected key #{n} with state #{inspect(state)}")
        {:reply, nil, state}

      true ->
        {:reply, state.facts[n], state}
    end

    {:reply, state.facts[n], state}
  end
end

k = Solution.get()
FactServer.start()

Solution.pascal(k)

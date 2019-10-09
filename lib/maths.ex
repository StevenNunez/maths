defmodule PartialOperation, do: defstruct [:operator, :number]
defmodule Maths.NumberGenerator do
  defmacro __using__(number_map) do
    for {func_name, value} <- number_map do
      quote do
        def unquote(func_name)(), do: unquote(value)
        def unquote(func_name)(%PartialOperation{} = po) do
          do_calculation(unquote(value), po)
        end
      end
    end
  end
end
defmodule Maths do
  use Maths.NumberGenerator, [
    one: 1,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9
  ]

  def divided_by(number) do
    %PartialOperation{
      operator: :divided_by,
      number: number
    }
  end

  def divided_by(n1, n2) do
    n2 / n1
  end

  def times(number) do
    %PartialOperation{
      operator: :times,
      number: number
    }
  end

  def times(n1, n2) do
    n1 * n2
  end

  def minus(number) do
    %PartialOperation{
      operator: :minus,
      number: number
    }
  end

  def minus(n1, n2) do
    n2 - n1
  end

  def plus(number) do
    %PartialOperation{
      operator: :plus,
      number: number
    }
  end

  def plus(n1, n2) do
    n1 + n2
  end

  defp do_calculation(number, %PartialOperation{operator: op, number: n}) do
    apply(__MODULE__, op, [n, number])
  end
end

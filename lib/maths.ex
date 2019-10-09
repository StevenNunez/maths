defmodule Maths.NumberGenerator do
  defmacro __using__(number_map) do
    for {func_name, value} <- number_map do
      quote do
        def unquote(func_name)(), do: unquote(value)
        def unquote(func_name)(po) do
          po.(unquote(value))
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
    fn n -> n / number end
  end

  def times(number) do
    fn n -> n * number end
  end

  def minus(number) do
    fn n -> n - number end
  end

  def plus(number) do
    fn n -> number + n end
  end
end

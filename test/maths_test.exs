defmodule MathsTest do
  use ExUnit.Case
  doctest Maths

  test "does addition" do
    numbers = [one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9]
    for {num_func1, val1} <- numbers, {num_func2, val2} <- numbers do
      operand = apply(Maths, num_func2, [])
      result = apply(Maths, num_func1, [Maths.plus(operand)])
      assert result == val1 + val2
    end
  end

  test "does subraction" do
    assert Maths.two(Maths.minus(Maths.one)) == 1
    numbers = [one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9]
    for {num_func1, val1} <- numbers, {num_func2, val2} <- numbers do
      operand = apply(Maths, num_func2, [])
      result = apply(Maths, num_func1, [Maths.minus(operand)])
      assert result == val1 - val2
    end
  end

  test "does multiplication" do
    numbers = [one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9]
    for {num_func1, val1} <- numbers, {num_func2, val2} <- numbers do
      operand = apply(Maths, num_func2, [])
      result = apply(Maths, num_func1, [Maths.times(operand)])
      assert result == val1 * val2
    end
  end

  test "does division" do
    assert Maths.eight(Maths.divided_by(Maths.two)) == 4
    numbers = [one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9]
    for {num_func1, val1} <- numbers, {num_func2, val2} <- numbers do
      operand = apply(Maths, num_func2, [])
      result = apply(Maths, num_func1, [Maths.divided_by(operand)])
      assert result == val1 / val2
    end
  end
end

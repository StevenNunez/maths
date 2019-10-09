defmodule Maths do
  defmodule PartialOperation, do: defstruct [:operator, :number]

  def one, do: 1
  def one(%PartialOperation{} = po) do
    do_calculation(1, po)
  end
  def two, do: 2
  def two(%PartialOperation{} = po) do
    do_calculation(2, po)
  end
  def three, do: 3
  def three(%PartialOperation{} = po) do
    do_calculation(3, po)
  end

  def four, do: 4
  def four(%PartialOperation{} = po) do
    do_calculation(4, po)
  end

  def five, do: 5
  def five(%PartialOperation{} = po) do
    do_calculation(5, po)
  end

  def six, do: 6
  def six(%PartialOperation{} = po) do
    do_calculation(6, po)
  end

  def seven, do: 7
  def seven(%PartialOperation{} = po) do
    do_calculation(7, po)
  end

  def eight, do: 8
  def eight(%PartialOperation{} = po) do
    do_calculation(8, po)
  end

  def nine, do: 9
  def nine(%PartialOperation{} = po) do
    do_calculation(9, po)
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

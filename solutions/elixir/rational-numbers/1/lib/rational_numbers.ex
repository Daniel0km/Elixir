
defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {a_elem, a_den} = a
    {b_elem, b_den} = b

    {a_elem * b_den + a_den * b_elem, a_den * b_den}
    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {a_elem, a_den} = a
    {b_elem, b_den} = b

    {a_elem * b_den - a_den * b_elem, a_den * b_den}
    |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {a_elem, a_den} = a
    {b_elem, b_den} = b

    {a_elem * b_elem, a_den * b_den}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {a_elem, a_den} = num
    {b_elem, b_den} = den

    {a_elem * b_den, a_den * b_elem}
    |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {num, den} = a

    {Kernel.abs(num), Kernel.abs(den)}
    |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational

  def pow_rational(a, n) do
    {num, den} = a
  
    if n < 0 do
      {den ** Kernel.abs(n), num ** Kernel.abs(n)}
      |> reduce()
    else
      {num ** n, den ** n}
      |> reduce()
    end
  end


  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {num, den} = n

    :math.pow(x, num / den)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({0, _}), do: {0, 1}

  def reduce({a, b}) when b != 0 do
    g = Integer.gcd(a, b)
    num = div(a, g)
    den = div(b, g)

    if den < 0 do
      {-num, -den}
    else
      {num, den}
    end
  end
end

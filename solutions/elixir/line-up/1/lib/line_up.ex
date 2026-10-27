defmodule LineUp do
  def format(name, number) when rem(number,100) in [11,12,13] do
    "#{name}, you are the #{number}th customer we serve today. Thank you!"
  end
  def format(name, number) when rem(number,10) == 1 when rem(number,10) == 1 do
    "#{name}, you are the #{number}st customer we serve today. Thank you!"
  end
  def format(name, number) when rem(number,10) == 2 do
    "#{name}, you are the #{number}nd customer we serve today. Thank you!"
  end
  def format(name, number) when rem(number,10) == 3 do
    "#{name}, you are the #{number}rd customer we serve today. Thank you!"
  end
  def format(name, number) do
    "#{name}, you are the #{number}th customer we serve today. Thank you!"
  end
end

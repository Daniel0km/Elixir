defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 && legacy? == false -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 && legacy? == false -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    cond do
      level == 0 && legacy? == false -> :false
      level == 1 -> :false
      level == 2 -> :false
      level == 3 -> :false
      level == 4 -> :ops
      level == 5 && legacy? == false -> :ops
      legacy? == true -> :dev1
      true -> :dev2
    end
  end
end

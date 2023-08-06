defmodule ExytTest do
  use ExUnit.Case
  doctest Exyt

  test "greets the world" do
    assert Exyt.hello() == :world
  end
end

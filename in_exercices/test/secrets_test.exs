defmodule SecretsTest do
  use ExUnit.Case

  test "Create an adder" do
   add = Secrets.secret_add(3)
   assert add.(3) === 6
  end

  test "Create a subtractor" do
    subtract = Secrets.secret_subtract(6)
    assert subtract.(3) === -3
  end

  test "Create a multiplier" do
    multiply = Secrets.secret_multiply(6)
    assert multiply.(7) === 42
  end

  test "Create a divider" do
    divide = Secrets.secret_divide(6)
    assert divide.(7) === 1
  end

  test "Create an 'and'-er" do
    ander = Secrets.secret_and(7)
    assert ander.(7) === 7
  end

  test "Create an 'xor'-er" do
    xorer = Secrets.secret_xor(7)
    assert xorer.(7) === 0
  end

  test "Create a function combiner" do
    f = Secrets.secret_divide(10)
    g = Secrets.secret_add(10)
    h = Secrets.secret_combine(f, g)
    x = Secrets.secret_add(3)
    y = Secrets.secret_xor(7)
    z = Secrets.secret_combine(x, y)
    assert h.(100) === 20
    assert z.(4) === 0
  end
end

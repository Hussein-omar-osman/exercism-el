defmodule KitchenCalculator do
  @moduledoc """
  Documentation for `KitchenCalculator`.
  """

  def get_volume({_, num}) do
    # Please implement the get_volume/1 function
    num
  end

  def to_milliliter({us, num}) do
    # Please implement the to_milliliter/1 functions
    case us do
      :cup -> {:milliliter, num * 240}
      :fluid_ounce -> {:milliliter, num * 30}
      :teaspoon -> {:milliliter, num * 5}
      :tablespoon -> {:milliliter, num * 15}
      :milliliter -> {:milliliter, num}
    end
  end

  def from_milliliter({_, num}, unit) do
    # Please implement the from_milliliter/2 functions
    case unit do
      :cup -> {unit, num / 240}
      :fluid_ounce -> {unit, num / 30}
      :teaspoon -> {unit, num / 5}
      :tablespoon -> {unit, num / 15}
      :milliliter -> {unit, num}
    end
  end

  def convert(volume_pair, unit) do
    # Please implement the convert/2 function
    to_ml = to_milliliter(volume_pair)
    from_milliliter(to_ml, unit)
  end
end

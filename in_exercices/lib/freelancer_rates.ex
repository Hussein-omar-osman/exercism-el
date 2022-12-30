defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    # Please implement the daily_rate/1 function
     8 * hourly_rate / 1
  end

  def apply_discount(before_discount, discount) do
    # Please implement the apply_discount/2 function
    r = 100 - discount
    y = before_discount * r
    y / 100
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
    daily_rate(hourly_rate) * 22 |> apply_discount(discount) |> Float.ceil(0) |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
    total = budget * 22
    m_rate = monthly_rate(hourly_rate, discount)
    total / m_rate |> Float.floor(1)
  end
end

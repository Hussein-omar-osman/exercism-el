defmodule FreelancerRatesTest do
  use ExUnit.Case

  test "testing the daily rates" do
   assert FreelancerRates.daily_rate(50) == 400.0
   assert FreelancerRates.daily_rate(60) === 480.0
   assert FreelancerRates.daily_rate(55.1) == 440.8
  end

  test "calculate a discounted price" do
   assert FreelancerRates.apply_discount(140.0, 10) == 126.0
   assert FreelancerRates.apply_discount(100, 10) == 90.0
   assert_in_delta FreelancerRates.apply_discount(111.11, 13.5), 96.11015, 1.0e-6
  end

  test "calculate the monthly rate, given an hourly rate and a discount" do
    assert FreelancerRates.monthly_rate(62, 0.0) == 10912
    assert FreelancerRates.monthly_rate(70, 0.0) === 12320
    assert FreelancerRates.monthly_rate(67, 12.0) == 10377
  end

  test "calculate the number of workdays given a budget, hourly rate and discount" do
    assert FreelancerRates.days_in_budget(1600, 50, 0.0) == 4
    assert FreelancerRates.days_in_budget(4410, 55, 0.0) == 10.0
    assert FreelancerRates.days_in_budget(4480, 55, 0.0) == 10.1
    assert FreelancerRates.days_in_budget(480, 60, 20) == 1.2
  end

end

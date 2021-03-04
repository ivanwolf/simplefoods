module ApplicationHelper
  def currency_formatter(amount)
    number_to_currency(amount, precision: 0, unit: "$", format: "%u %n")
  end
end

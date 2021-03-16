module ApplicationHelper
  def currency_formatter(amount)
    number_to_currency(amount, precision: 0, unit: "$", format: "%u %n")
  end

  def title_with_back_button(title, subtitle = "")
    render partial: "components/title_with_back_button", locals: { title: title, subtitle: subtitle }
  end
end

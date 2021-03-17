module ApplicationHelper
  def currency_formatter(amount)
    number_to_currency(amount, precision: 0, unit: "$", format: "%u %n")
  end

  def phone_formatter(phone_number)
    number_to_phone(
      phone_number.number,
      country_code: phone_number.country_code,
      pattern: /(\d{1})(\d{4})(\d{4})/,
      delimiter: ' '
    )
  end

  def title_with_back_button(title, subtitle = "")
    render partial: "components/title_with_back_button", locals: { title: title, subtitle: subtitle }
  end

  def title_with_action_button(title, label, path)
    render partial: "components/title_with_action_button", locals: { title: title, label: label, path: path}
  end
end

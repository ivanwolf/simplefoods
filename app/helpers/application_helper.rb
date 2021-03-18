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

  def new_friendly_order_url(workday)
    root_url +  workday.store.slug + "/" + workday.to_slug
  end

  def title_with_back_button(title, subtitle = "")
    render partial: "components/title_with_back_button", locals: { title: title, subtitle: subtitle }
  end

  def title_with_action_button(title, label, path)
    render partial: "components/title_with_action_button", locals: { title: title, label: label, path: path}
  end

  def country_codes_collection
    ISO3166::Country.all.map do |c|
      ["+#{c.country_code}", c.country_code]
    end.uniq.sort
  end
end

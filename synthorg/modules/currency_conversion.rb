# frozen_string_literal: true

# shows value in desired currency (assume USD as base currency)
module CurrencyConversion
  def convert_currency_to(value, currency)
    case currency
    when 'USD'
      value.round(2)
    when 'CAD'
      (value * 1.35).round(2)
    when 'EUR'
      (value * 0.65).round(2)
    else
      "'#{currency}' currency not found."
    end
  end
end

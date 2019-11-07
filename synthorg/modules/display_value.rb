# frozen_string_literal: true

# shows value in desired currency (assume USD as base currency)
module DisplayValue
  def usd(value)
    value.round(2)
  end

  def cad
    (value * 1.35).round(2)
  end

  def eur
    (value * 0.65).round(2)
  end
end

# frozen_string_literal: true

# trades are usually a collection of serials
class TradePaperBack < Comic
  attr_accessor :collected, :isbn

  def initialize(info)
    @collected = info['collects']
    super(info)
  end
end

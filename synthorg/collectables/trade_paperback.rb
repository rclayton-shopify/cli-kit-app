# frozen_string_literal: true

# trades are usually a collection of serials
class TradePaperBack < Comic
  attr_accessor :collected

  def initialize(info)
    @collected = info['collects']
    super(info)
  end

  def collected_description
    "#{@title}#{' ' + @issue unless issue.nil?} collects #{@collected.map do
      |comic| "#{comic['title']} issues #{comic['issues']}"
    end.join(', ')}"
  end
end

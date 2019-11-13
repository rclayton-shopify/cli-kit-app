# frozen_string_literal: true

# base comic class
class AnimeFigure
  attr_accessor :manufacturer, :line, :series, :characters, :sculptors, :value
  include CurrencyConversion

  def initialize(info)
    @manufacturer = info['manufacturer']
    @line = info['line']
    @series = info['series']
    @characters = info['characters']
    @sculptors = info['sculptors']
    @value = info['value']
    @release = info['release']
  end

  def release_info
    "#{@characters.join(' ')} #{'from ' + @series unless @series.nil?} was released on "\
    "#{@release} by #{@manufacturer} for #{@line}."
  end
end

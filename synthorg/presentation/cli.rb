# frozen_string_literal: true

require 'minitest/autorun'

# CLI entry point for data manipulation
class CLI
  attr_accessor :collectables

  def initialize
    @collectables = []
  end

  def find_all_of_type(type)
    @collectables.select do |item|
      item.is_a? type
    end
  end

  def bulk_value_update_by_type(percentage, type)
    find_all_of_type(type).map! do |item|
      item.value * percentage
    end
  end

  def get_collection_value(type = Object)
    find_all_of_type(type).reduce(0) do |sum, item|
      sum + item.value
    end
  end

  def sell_on_kijiji_or_ebay(cutoff)
    @collectables.partition do |item|
      item.value < cutoff
    end
  end
end

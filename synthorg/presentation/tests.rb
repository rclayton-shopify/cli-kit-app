# frozen_string_literal: true

require 'minitest/autorun'
require './command_line'
require '../collectables/comic'
require '../collectables/graphic_novel'
require '../collectables/trade_paperback'
require '../collectables/anime_figure'
require 'yaml'

# test CLI stuff
class TestCLI < Minitest::Test
  def setup
    @testable = CommandLine.new
    collectables = YAML.load_file('../class_attributes.yaml')
    @testable.collectables.push(GraphicNovel.new(collectables['graphic_novel']))
    @testable.collectables.push(TradePaperBack.new(collectables['trade_paperback']))
    @testable.collectables.push(AnimeFigure.new(collectables['anime_figure']))
    @testable.collectables.push(Comic.new(collectables['comic']))
  end

  def test_total_comics_owned
    assert_equal 3, @testable.find_all_of_type('Comic').count
  end

  def test_get_total_collection_value
    assert_equal 10_129.96, @testable.get_collection_value
  end

  def test_update_figure_values
    assert_equal 199.98, @testable.bulk_value_update_by_type(2.0, 'AnimeFigure')[0]
  end

  def test_sell_on_ebay
    assert_equal 1, @testable.sell_on_kijiji_or_ebay(100)[1].count
  end
end

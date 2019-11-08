require 'minitest/autorun'
require_relative '../collectables/comic'
require_relative '../collectables/graphic_novel'
require_relative '../collectables/anime_figure'
require_relative '../collectables/trade_paperback'
require_relative '../modules/currency_conversion'
require 'yaml'

# test
class ComicTests < Minitest::Test
  def setup
    @collectables = YAML.load_file('../class_attributes.yaml')
    @gnovel = GraphicNovel.new(@collectables['graphic_novel'])
    @tpb = TradePaperBack.new(@collectables['trade_paperback'])
    @figure = AnimeFigure.new(@collectables['anime_figure'])
    @comic = Comic.new(@collectables['comic'])
  end

  def test_yaml_load
    assert !@collectables.nil?
  end

  def test_graphic_novel_class
    assert !@gnovel.isbn.nil?
  end

  def test_trade_paperback_class
    assert !@tpb.collected.nil?
    assert !@tpb.collected_description.nil?
  end

  def test_anime_figure_class
    assert !@figure.sculptors.nil?
  end

  def test_descriptions
    assert !@comic.creator_info.nil?
  end

  def test_currency_module
    assert_equal 99.99, @figure.convert_currency_to(@figure.value, 'USD')
    assert_equal 134.99, @figure.convert_currency_to(@figure.value, 'CAD')
    assert_equal 6.49, @gnovel.convert_currency_to(@gnovel.value, 'EUR')
    assert_equal "'ZWE' currency not found.", @gnovel.convert_currency_to(@gnovel.value, 'ZWE')
  end
end

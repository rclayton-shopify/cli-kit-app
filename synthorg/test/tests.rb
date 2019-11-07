require 'minitest/autorun'
require_relative '../classes/collectables.rb'

# test
class ComicTests < Minitest::Test
  def setup
    @collectables = Collectables.new
  end

  def test_yaml_load
    assert !@collectables.collection.nil?
  end

  def test_graphic_novel_class
    gnovel = GraphicNovel.new(@collectables.collection['graphic_novel'])
    assert !gnovel.isbn.nil?
  end

  def test_trade_paperback_class
    tpb = TradePaperBack.new(@collectables.collection['trade_paperback'])
    assert !tpb.collected.nil?
    assert !tpb.collected_description.nil?
  end

  def test_anime_figure_class
    figure = AnimeFigure.new(@collectables.collection['anime_figure'])
    assert !figure.sculptors.nil?
  end

  def test_descriptions
    comic = Comic.new(@collectables.collection['comic'])
    assert !comic.creator_info.nil?
  end

  def test_currency_module
    figure = AnimeFigure.new(@collectables.collection['anime_figure'])
    gnovel = GraphicNovel.new(@collectables.collection['graphic_novel'])
    assert_equal 99.99, figure.usd
    assert_equal 134.99, figure.cad
    assert_equal 6.49, gnovel.eur
  end
end

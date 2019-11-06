require 'minitest/autorun'
require_relative '../comics/comic-library.rb'

# test
class ComicTests < Minitest::Test
  def setup
    @comics = ComicLibrary.new
  end

  def test_yaml_load
    assert !@comics.collection.nil?
  end

  def test_serial_class
    serial = Serial.new(@comics.collection['serial'])
    assert !serial.upc.nil?
  end

  def test_graphic_novel_class
    graphic_novel = GraphicNovel.new(@comics.collection['graphic_novel'])
    assert !graphic_novel.isbn.nil?
  end

  def test_trade_paperback_class
    tpb = TradePaperBack.new(@comics.collection['trade_paperback'])
    assert !tpb.collected.nil?
  end
end

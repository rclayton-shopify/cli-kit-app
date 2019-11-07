require_relative './comic'
require_relative './graphic_novel'
require_relative './anime_figure'
require_relative './trade-paperback'
require_relative '../modules/display_value'
require 'yaml'

# handles inventory
class Collectables
  attr_accessor :collection
  def initialize
    @collection = YAML.load_file('../class_attributes.yaml')
  end
end

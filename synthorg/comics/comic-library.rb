require_relative './comic'
require_relative './graphic_novel'
require_relative './serial'
require_relative './trade-paperback'
require 'yaml'

# handles comic inventory
class ComicLibrary
  attr_accessor :collection
  def initialize
    @collection = YAML.load_file('../comics.yaml')
  end
end

# frozen_string_literal: true

# base comic class
class Comic
  attr_accessor :publisher, :title, :writers, :artists
  def initialize(info)
    @publisher = info['publisher']
    @title = info['title']
    @writers = info['writers']
    @artists = info['artists']
  end
end

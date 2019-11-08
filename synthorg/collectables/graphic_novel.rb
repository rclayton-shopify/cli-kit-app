# frozen_string_literal: true

# longer format comics that are a limited series or just one-offs
class GraphicNovel < Comic
  attr_accessor :isbn

  def initialize(info)
    @isbn = info['isbn']
    super(info)
  end
end

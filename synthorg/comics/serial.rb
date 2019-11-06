# frozen_string_literal: true

# indefinately on-going, short form comic
class Serial < Comic
  attr_accessor :upc

  def initialize(info)
    @upc = info['upc']
    super(info)
  end
end

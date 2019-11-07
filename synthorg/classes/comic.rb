# frozen_string_literal: true
require '../modules/display_value'

# base comic class
class Comic
  attr_accessor :publisher, :title, :writers, :artists, :release, :issue, :value
  include DisplayValue

  def initialize(info)
    @publisher = info['publisher']
    @title = info['title']
    @writers = info['writers']
    @artists = info['artists']
    @release = info['release']
    @issue = info['issue']
    @value = info['value']
  end

  def creator_info
    "#{@title} #{@issue unless @issue.empty?} was written by " \
    "#{@writers.join(', ')} and illustrated by #{@artists.join(', ')}."
  end

  def release_info
    "#{@title} #{@issue unless @issue.empty?} was released on #{@release}" \
    "by #{@publisher}."
  end
end

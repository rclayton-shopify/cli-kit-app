# frozen_string_literal: true

require_relative '../../synthorg'
require_relative '../../../presentation/command_line'
require 'yaml'
require_relative '../../../collectables/comic'
require_relative '../../../collectables/graphic_novel'
require_relative '../../../collectables/trade_paperback'
require_relative '../../../collectables/anime_figure'

module Synthorg
  module Commands
    class Value < Synthorg::Command
      def call(args, _name)
        cl = CommandLine.new
        collectables = YAML.load_file('../class_attributes.yaml')
        cl.collectables.push(GraphicNovel.new(collectables['graphic_novel']))
        cl.collectables.push(TradePaperBack.new(collectables['trade_paperback']))
        cl.collectables.push(AnimeFigure.new(collectables['anime_figure']))
        cl.collectables.push(Comic.new(collectables['comic']))
        puts cl.get_collection_value(args[0])
      end

      def self.help
        "Gets total value of your collection.\n"\
        "Usage: {{command:#{Synthorg::TOOL_NAME} }} <collectable type>"
      end
    end
  end
end

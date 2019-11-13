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
    class List < Synthorg::Command
      def call(args, _name)
        cl = CommandLine.new
        collectables = YAML.load_file('../class_attributes.yaml')
        cl.collectables.push(GraphicNovel.new(collectables['graphic_novel']))
        cl.collectables.push(TradePaperBack.new(collectables['trade_paperback']))
        cl.collectables.push(AnimeFigure.new(collectables['anime_figure']))
        cl.collectables.push(Comic.new(collectables['comic']))
        puts cl.find_all_of_type(args[0]).map(&:release_info)
      end

      def self.help
        "Lists all collectables of a certain type in your collection.\n"\
        "Usage: {{command:#{Synthorg::TOOL_NAME} }} <collectable type>"
      end
    end
  end
end

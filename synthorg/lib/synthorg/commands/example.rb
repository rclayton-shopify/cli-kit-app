require 'synthorg'

module Synthorg
  module Commands
    class Example < Synthorg::Command
      def call(_args, _name)
        puts 'neato'

        if rand < 0.05
          raise(CLI::Kit::Abort, "you got unlucky!")
        end
      end

      def self.help
        "A dummy command.\nUsage: {{command:#{Synthorg::TOOL_NAME} example}}"
      end
    end
  end
end

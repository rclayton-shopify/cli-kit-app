require 'synthorg'

module Synthorg
  module EntryPoint
    def self.call(args)
      cmd, command_name, args = Synthorg::Resolver.call(args)
      Synthorg::Executor.call(cmd, command_name, args)
    end
  end
end

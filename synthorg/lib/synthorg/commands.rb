require 'synthorg'

module Synthorg
  module Commands
    Registry = CLI::Kit::CommandRegistry.new(
      default: 'help',
      contextual_resolver: nil
    )

    def self.register(const, cmd, path)
      autoload(const, path)
      Registry.add(->() { const_get(const) }, cmd)
    end

    register :Example, 'example', 'synthorg/commands/example'
    register :Help,    'help',    'synthorg/commands/help'
    register :List,    'list',    'synthorg/commands/list'
    register :Value,   'value',   'synthorg/commands/value'
  end
end

module Styx
  class Entry

    def initialize(data)
      @data = data
    end

    def type
      types.fetch(data['op'], :unknown)
    end

    def document
      data['o']
    end

    def database
      namespace.first
    end

    def collection
      namespace.last
    end

    def type_of?(operation)
      type == operation
    end

    private
    attr_reader :data

    def namespace
      data['ns'].split('.', 2)
    end

    def types
      {
        'n' => :noop,
        'i' => :insert,
        'u' => :update,
        'd' => :delete,
        'c' => :command
      }
    end
  end
end

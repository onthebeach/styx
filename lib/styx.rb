require 'styx/version'

module Styx
  #    # create a mongo connection
  #    connection = Styx::Connection.new('localhost:27017')
  #
  #    # pass the connection to the river
  #    river = Styx::River.new(connection)
  #
  #    # create an observer class
  #    class MyWatcher < Styx::Watcher
  #      def update(entry)
  #        # do stuff with entry
  #        puts entry.inspect if entry.type_of?(:insert)
  #      end
  #    end
  #
  #    # register the observers
  #    MyWatcher.new(river)
  #
  #    # watch the river
  #    river.watch
  #
  #    # exit with ctrl-c
  #
end

require 'styx/connection'
require 'styx/entry'
require 'styx/river'
require 'styx/watcher'


require 'observer'

module Styx
  class River
    include Observable
    attr_writer :stop

    def initialize(connection)
      @connection = connection
    end

    def watch
      loop do
        connection.tail do |entry|
          changed
          notify_observers Entry.new(entry)
        end

        %w[TERM INT USR2].each do |sig|
          Signal.trap(sig) do
            puts "#{sig} - exiting.."
            exit
          end
        end

        break if stop
      end
    end

    private
    attr_reader :connection

    def stop
      @stop ||= false
    end
  end
end

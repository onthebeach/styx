require 'mongo'
module Styx
  class Connection

    def initialize(target, options={})
      @target = Array(target).flatten
      @options = default_options.merge(options)
    end

    def tail
      yield cursor.next while cursor.has_next?
    end

    def close
      cursor.close
    end

    private
    attr_reader :target, :options
    attr_writer :cursor

    def default_options
      {
        op_timeout: 86400
      }
    end

    def query
      {
        'ts' => {
          '$gte' => timestamp
        }
      }
    end

    def timestamp
      BSON::Timestamp.new(Time.now.to_i, 20)
    end

    def connection
      @connection ||= Mongo::ReplSetConnection.new(target, options)
    end

    def oplog
      @oplog ||= connection.db('local').collection('oplog.rs')
    end

    def cursor
      @cursor || set_cursor
    end

    def set_cursor
      oplog.find(query, timeout: false) do |finder|
        finder.add_option(Mongo::Constants::OP_QUERY_TAILABLE)
        finder.add_option(Mongo::Constants::OP_QUERY_OPLOG_REPLAY)
        finder.add_option(Mongo::Constants::OP_QUERY_AWAIT_DATA)
        self.cursor = finder
      end

      return cursor
    end
  end
end

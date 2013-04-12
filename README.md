# Styx

Easily and selectively do interesting things with the river of data that is your
MongoDB oplog

## Installation

Add this line to your application's Gemfile:

    gem 'styx', github: 'onthebeach/styx', branch: :master

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install styx

## Usage

    # create a mongo connection
    connection = Styx::Connection.new('localhost:27017')

    # pass the connection to the river
    river = Styx::River.new(connection)

    # create an observer class
    class MyWatcher < Styx::Watcher
     def update(entry)
       # do stuff with entry
       puts entry.inspect if entry.type_of?(:insert)
     end
    end

    # register the observers
    MyWatcher.new(river)

    # watch the river
    river.watch

The river creates a tailable cursor on the opslogs, and passes a new entry object to
any registered observers

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

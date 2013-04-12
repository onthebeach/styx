# Styx[![Build Status](https://travis-ci.org/onthebeach/styx.png)](http://travis-ci.org/onthebeach/styx) [![Code Climate](https://codeclimate.com/github/onthebeach/styx.png)](https://codeclimate.com/github/onthebeach/styx)

Easily and selectively do interesting things with the river of data that is your
MongoDB oplog.

## Installation

Add this line to your application's Gemfile:

    gem 'styx', github: 'onthebeach/styx', branch: :master

And then execute:

    $ bundle

Styx is not currently available on rubygems due to some unfortunate name clashing

## Usage

    # create a mongo connection (must be a Replica Set)
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
any registered observers.

Inspired by [Stripe's Mongoriver](https://github.com/stripe/mongoriver)

### Copyright

Copyright (c) 2013 OnTheBeach Ltd. See LICENSE.txt for further details.

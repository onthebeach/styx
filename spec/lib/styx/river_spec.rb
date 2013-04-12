require 'spec_helper'

module Styx
  describe River do
    let(:river) { River.new(connection) }
    let(:connection) { stub }

    describe '#new' do
      it 'takes a connection' do
        river
      end
    end

    describe '#watch' do
      let(:entry) { stub }
      let(:data) { stub }

      before do
        connection.expects(:tail).yields(data)
        river.expects(:changed)
        Entry.expects(:new).with(data).returns(entry)
        river.expects(:notify_observers).with(entry)
      end

      it 'tails the connection, notifies observers' do
        river.stop = true
        river.watch
      end
    end
  end
end

require 'spec_helper'

module Styx

  class MyWatcher < Watcher
    def update(entry)
      entry
    end
  end

  describe MyWatcher do
    let(:watcher) { MyWatcher.new(target) }
    let(:target) { stub }
    let(:entry) { stub }

    describe '#new' do
      before do
        target.expects(:add_observer).with(watcher)
      end
      it 'registers as an observer' do
        watcher
      end
    end

    describe '#update' do
      before do
        target.stubs(:add_observer).with(watcher)
      end

      it 'receives the entry' do
        expect(watcher.update(entry)).to eq entry
      end
    end
  end
end

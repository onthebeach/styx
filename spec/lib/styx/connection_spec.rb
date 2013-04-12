require 'spec_helper'

module Styx
  describe Connection do
    let(:connection) { Connection.new(target, options) }
    let(:target) { 'localhost:27017' }
    let(:options) { {test: true} }

    describe 'tailing the opslog' do
      it 'tails' do
        # connection.tail
      end
    end
  end
end

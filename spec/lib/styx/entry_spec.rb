require 'spec_helper'

module Styx
  describe Entry do
    let(:entry) { Entry.new(data) }
    let(:document) { stub }
    let(:op) { 'i' }

    let(:data) {
      {
        'op' => op,
        'ns' => 'database.collection.name',
        'o'  => document
      }
    }

    describe '#new' do
      it 'takes the entry data' do
        entry
      end
    end

    describe '#type' do
      it 'returns the op name' do
        expect(entry.type).to eq :insert
      end
    end

    describe '#document' do
      it 'returns the document' do
        expect(entry.document).to eq document
      end
    end

    describe '#database' do
      it 'returns the database name' do
        expect(entry.database).to eq 'database'
      end
    end

    describe '#collection' do
      it 'returns the collection name' do
        expect(entry.collection).to eq 'collection.name'
      end
    end

    describe '#type_of?' do
      subject { entry.type_of?(:insert) }

      context 'op is "i"' do
        it { should be_true }
      end

      context 'op is not "i"' do
        let(:op) { 'n' }
        it { should be_false }
      end
    end
  end
end

# frozen_string_literal: true

require 'diary'

describe Diary do
  let(:database_class) { double :database_class }
  let(:test_diary) { Diary.new(database_class) }
  describe '#add' do
    it 'stores a diary entry in the database (assuming it is connected)' do
      expect(database_class).to receive(:query).with("INSERT INTO entries (id, entry) VALUES (DEFAULT, 'Dear Diary');")
      test_diary.add("Dear Diary")
    end
  end
end

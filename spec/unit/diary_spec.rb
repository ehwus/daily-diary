# frozen_string_literal: true

require 'diary'

describe Diary do
  let(:database_class) { double :database_class }
  let(:test_diary) { Diary.new(database_class) }
  describe '#add' do
    it 'stores a diary entry in the database with title and body' do
      expect(database_class).to receive(:query).with("INSERT INTO entries (id, title, body) VALUES (DEFAULT, 'Dear Diary', 'Test Body');")
      test_diary.add("Dear Diary", "Test Body")
    end
  end
end

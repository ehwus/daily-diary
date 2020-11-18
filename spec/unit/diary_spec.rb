# frozen_string_literal: true

require 'diary'

describe Diary do
  describe '#add' do
    it 'stores a diary entry in the database' do
      subject.add("Dear Diary")
      expect(subject.entries).to contain("Dear Diary")
    end
  end
end

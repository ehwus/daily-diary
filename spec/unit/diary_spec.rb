# frozen_string_literal: true

require 'diary'
require 'pg'

describe Diary do
  it "initialises with a title and body" do
    test = Diary.new(title: "Test", body: "Test Body")
    expect(test.title).to eq("Test")
    expect(test.body).to eq("Test Body")
  end

  describe ".create, .all" do
    it "Creates a new entry with a body and title, retrievable in array with .all" do
      Diary.create(title: "Foo", body: "Bar")
      entry = Diary.all.first
      expect(entry).to be_instance_of(Diary)
      expect(entry.title).to eq("Foo")
      expect(entry.body).to eq("Bar")
    end
  end
end

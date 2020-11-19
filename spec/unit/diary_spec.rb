# frozen_string_literal: true

require 'diary'
require 'pg'

describe Diary do
  it "initialises with a title, body and id" do
    test = Diary.new(id: 1, title: "Test", body: "Test Body")
    expect(test.id).to eq(1)
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

  describe ".select" do
    it "returns a Diary object by ID" do
      Diary.create(title: "Foo", body: "Bar")
      id = Diary.all.first.id
      returned_object = Diary.select(id)
      expect(returned_object.title).to eq("Foo")
      expect(returned_object.body).to eq("Bar")
    end
  end

  describe ".delete" do
    it "removes an entry with given id" do
      Diary.create(title: "Foo", body: "Bar")
      id = Diary.all.first.id
      Diary.delete(id)
      expect(Diary.all).to be_empty
    end

  end
end

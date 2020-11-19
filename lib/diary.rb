require 'pg'

class Diary
  def self.create(title:, body:)
    DatabaseConnection.query("INSERT INTO entries (title, body) VALUES ('#{title}', '#{body}');")
  end

  def self.all
    selection = DatabaseConnection.query("SELECT * FROM entries;")
    selection.map { |entry| Diary.new(id: entry['id'], title: entry['title'], body: entry['body']) }
  end

  def self.select(id)
    selection = DatabaseConnection.query("SELECT * FROM entries WHERE id='#{id}';")
    selection.map { |entry| Diary.new(id: entry['id'], title: entry['title'], body: entry['body']) }.first
  end
  
  attr_reader :title, :body, :id

  def initialize(id:, title:, body:)
    @id = id
    @title = title
    @body = body
  end
end
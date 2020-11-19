require 'pg'

class Diary
  def self.create(title:, body:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_manager_test')
    else
      connection = PG.connect(dbname: 'diary_manager')
    end
    connection.exec("INSERT INTO entries (title, body) VALUES ('#{title}', '#{body}');")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_manager_test')
    else
      connection = PG.connect(dbname: 'diary_manager')
    end
    selection = connection.exec("SELECT * FROM entries;")
    selection.map { |entry| Diary.new(id: entry['id'], title: entry['title'], body: entry['body']) }
  end

  def self.select(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_manager_test')
    else
      connection = PG.connect(dbname: 'diary_manager')
    end
    selection = connection.exec("SELECT * FROM entries WHERE id='#{id}';")
    selection.map { |entry| Diary.new(id: entry['id'], title: entry['title'], body: entry['body']) }.first
  end
  
  attr_reader :title, :body, :id

  def initialize(id:, title:, body:)
    @id = id
    @title = title
    @body = body
  end
end
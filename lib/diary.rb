require 'pg'

class Diary
  # def add(title, body)
  #   @database.query("INSERT INTO entries (id, title, body) VALUES (DEFAULT, '#{title}', '#{body}');")
  # end
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
    selection.map { |entry| Diary.new(title: entry['title'], body: entry['body']) }
  end
  
  attr_reader :title, :body

  def initialize(title:, body:)
    @title = title
    @body = body
  end
end
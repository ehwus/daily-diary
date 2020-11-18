require 'database_connection'

class Diary
  def initialize(database_class = DatabaseConnection)
    @database = database_class
  end

  def add(title, body)
    @database.query("INSERT INTO entries (id, title, body) VALUES (DEFAULT, '#{title}', '#{body}');")
  end
end
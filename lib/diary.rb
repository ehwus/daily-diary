require 'database_connection'

class Diary
  def initialize(database_class = DatabaseConnection)
    @database = database_class
  end

  def add(entry)
    @database.query("INSERT INTO entries (id, entry) VALUES (DEFAULT, '#{entry}');")
  end
end
require 'pg'

def set_up_test_database
  connection = PG.connect(dbname: 'diary_manager_test')
  connection.exec("DROP TABLE entries;")
  connection.exec("CREATE TABLE entries(id SERIAL PRIMARY KEY, entry TEXT);")
end
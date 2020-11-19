require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('diary_manager_test')
else
  DatabaseConnection.setup('diary_manager')
end
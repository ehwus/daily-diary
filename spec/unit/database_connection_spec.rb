require 'database_connection'
require 'pg'

describe DatabaseConnection do
  describe '.setup' do
    it 'connects to a given sql server' do
      expect(PG).to receive(:connect).with(dbname: 'diary_manager_test')
      DatabaseConnection.setup('diary_manager_test')
    end

    it "persists the connection" do
      connection = DatabaseConnection.setup('diary_manager_test')
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  # describe '.exec' do
  #   connection = DatabaseConnection.setup('diary_manager_test')
  #   expect(connection).to receive(:exec).with("SELECT * FROM entries;")
  #   DatabaseConnection.query("SELECT * FROM entries;")
  # end
end
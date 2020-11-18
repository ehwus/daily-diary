require 'database_connection'

describe DatabaseConnection do
  describe "#setup" do
    it 'sends the appropriate command to PG' do
      expect(PG).to receive(:connect).with(dbname: 'diary_manager_test')

      DatabaseConnection.setup('diary_manager_test')
    end
  end
  describe "#connection" do
    it "stores the connection" do
      connection = DatabaseConnection.setup('diary_manager_test')
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  describe "#query" do
    it "sends the command to the server as expected" do
      connection = DatabaseConnection.setup('diary_manager_test')
      expect(connection).to receive(:exec).with('SELECT * FROM entries;')

      DatabaseConnection.query('SELECT * FROM entries;')
    end
  end
end
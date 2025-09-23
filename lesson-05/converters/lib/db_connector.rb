# lib/db_connector.rb
require 'sqlite3'

class DBConnector
  def initialize(db_path = 'db/converter.db')
    @db = SQLite3::Database.new(db_path)
    @db.results_as_hash = true
  end

  def execute(query, params = [])
    @db.execute(query, params)
  end

  def close
    @db.close if @db
  end
end

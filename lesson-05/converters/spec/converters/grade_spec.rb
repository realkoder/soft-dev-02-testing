require_relative '../../lib/grade'
require_relative '../../repository/grade_repository'
require 'sqlite3'

RSpec.describe Grade do
  let(:db) do
    db = SQLite3::Database.new(':memory:')
    db.results_as_hash = true

    # create table
    db.execute <<-SQL
    CREATE TABLE grades (
      nGradeID INTEGER PRIMARY KEY AUTOINCREMENT,
      cDenmark TEXT NOT NULL,
      cUSA TEXT NOT NULL
    );
    SQL

    # insert data
    [['12', 'A+'], ['10', 'A'], ['7', 'B'], ['4', 'C'], ['02', 'D'], ['00', 'F'], ['-3', 'F']].each do |dk, us|
      db.execute "INSERT INTO grades (cDenmark, cUSA) VALUES (?, ?)", [dk, us]
    end

    db
  end

  let(:repository) { GradeRepository.new(db) }
  let(:grade) { described_class.new(repository) }

  describe 'positive #convert' do
    describe 'danish system converting to american' do

      [
        { value: '-3', expect: 'F' },
        { value: '00', expect: 'F' },
        { value: '02', expect: 'D' },
        { value: '4', expect: 'C' },
        { value: '7', expect: 'B' },
        { value: '10', expect: 'A' },
        { value: '12', expect: 'A+' },
      ].each do |example|
        it "converts danish grade #{example[:value]} to #{example[:expect]} american grade" do
          expect(grade.convert(example[:value], 'DK')).to eq(example[:expect])
        end
      end
    end

    describe 'american system converting to danish' do

      [
        { value: 'F', expect: '00' },
        { value: 'D', expect: '02' },
        { value: 'C', expect: '4' },
        { value: 'B', expect: '7' },
        { value: 'A', expect: '10' },
        { value: 'A+', expect: '12' },
      ].each do |example|
        it "converts danish grade #{example[:value]} to #{example[:expect]} american grade" do
          expect(grade.convert(example[:value], 'USA')).to eq(example[:expect])
        end
      end
    end
  end

  describe 'negative tests' do
    describe 'danish system converting to american' do

      [
        { value: -4, expect: nil },
        { value: -2, expect: nil },
        { value: -1, expect: nil },
        { value: 1, expect: nil },
        { value: 3, expect: nil },
        { value: 5, expect: nil },
        { value: 6, expect: nil },
        { value: 8, expect: nil },
        { value: 9, expect: nil },
        { value: 11, expect: nil },
        { value: 13, expect: nil },
      ].each do |example|
        it "converts danish grade #{example[:value]} to #{example[:expect]} no american grade" do
          expect(grade.convert(example[:value], 'DK')).to eq(example[:expect])
        end
      end
    end

    describe 'american system converting to danish' do
      [
        { value: 'E', expect: nil },
        { value: 'G', expect: nil },
      ].each do |example|
        it "converts danish grade #{example[:value]} to #{example[:expect]} no american grade" do
          expect(grade.convert(example[:value], 'DK')).to eq(example[:expect])
        end
      end
    end

  end
end

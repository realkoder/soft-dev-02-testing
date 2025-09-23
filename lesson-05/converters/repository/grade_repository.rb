class GradeRepository
  def initialize(db_connector)
    @db = db_connector
  end

  def find_conversion(value, grade_country)
    if grade_country == 'DK'
      row = @db.execute("SELECT cUSA FROM grades WHERE cDenmark = ?", [value]).first
      row && row['cUSA']
    else
      row = @db.execute("SELECT cDenmark FROM grades WHERE cUSA = ?", [value]).first
      row && row['cDenmark']
    end
  end
end

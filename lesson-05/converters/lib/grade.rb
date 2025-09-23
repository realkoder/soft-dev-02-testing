class Grade
  def initialize(repository)
    @repository = repository
  end

  def convert(grade, grade_country)
    @repository.find_conversion(grade, grade_country)
  end
end

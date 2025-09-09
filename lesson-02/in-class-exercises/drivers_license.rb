class DriversLicense

  def self.exam_result(theory_score, practical_errors)
    is_theory_parsed = theory_score >= 85
    is_practical_parsed = practical_errors <= 2

    return build_exam_result(true, false, false, false) if is_theory_parsed && is_practical_parsed

    return build_exam_result(false, false, false, true) if !is_practical_parsed && !is_theory_parsed

    build_exam_result(false, !is_theory_parsed, !is_practical_parsed, false)
  end

  private

  def self.build_exam_result(license_granted, repeat_theory, repeat_practical, lessons_needed)
    {
      license_granted: license_granted,
      repeat_theory: repeat_theory,
      repeat_practical: repeat_practical,
      lessons_needed: lessons_needed
    }
  end
end
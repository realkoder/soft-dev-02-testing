require_relative '../../in-class-exercises/drivers_license'

RSpec.describe DriversLicense do
  context 'positive tests' do
    [
      { theory_score: 85, practical_errors: 0, expected: { license_granted: true, repeat_theory: false, repeat_practical: false, lessons_needed: false } },
      { theory_score: 86, practical_errors: 0, expected: { license_granted: true, repeat_theory: false, repeat_practical: false, lessons_needed: false } },
      { theory_score: 92, practical_errors: 0, expected: { license_granted: true, repeat_theory: false, repeat_practical: false, lessons_needed: false } },
      { theory_score: 99, practical_errors: 0, expected: { license_granted: true, repeat_theory: false, repeat_practical: false, lessons_needed: false } },
      { theory_score: 100, practical_errors: 0, expected: { license_granted: true, repeat_theory: false, repeat_practical: false, lessons_needed: false } },
      { theory_score: 85, practical_errors: 1, expected: { license_granted: true, repeat_theory: false, repeat_practical: false, lessons_needed: false } },
      { theory_score: 85, practical_errors: 2, expected: { license_granted: true, repeat_theory: false, repeat_practical: false, lessons_needed: false } },
    ].each do |example|
      it "grants drivers license when theory score: #{example[:theory_score]} and practical errors: #{example[:practical_errors]}" do
        exam_result = DriversLicense.exam_result(example[:theory_score], example[:practical_errors])
        expect(exam_result).to eq(example[:expected])
      end
    end
  end

  context 'negative tests' do
    context 'repeat theory' do
      [
        { theory_score: 0, practical_errors: 0, expected: { license_granted: false, repeat_theory: true, repeat_practical: false, lessons_needed: false } },
        { theory_score: 1, practical_errors: 0, expected: { license_granted: false, repeat_theory: true, repeat_practical: false, lessons_needed: false } },
        { theory_score: 42, practical_errors: 0, expected: { license_granted: false, repeat_theory: true, repeat_practical: false, lessons_needed: false } },
        { theory_score: 83, practical_errors: 0, expected: { license_granted: false, repeat_theory: true, repeat_practical: false, lessons_needed: false } },
        { theory_score: 84, practical_errors: 0, expected: { license_granted: false, repeat_theory: true, repeat_practical: false, lessons_needed: false } },
      ].each do |example|
        it "requires repeated theory exam when theory score: #{example[:theory_score]} and practical errors: #{example[:practical_errors]}" do
          exam_result = DriversLicense.exam_result(example[:theory_score], example[:practical_errors])
          expect(exam_result).to eq(example[:expected])
        end
      end
    end

    context 'repeat practical' do
      [
        { theory_score: 85, practical_errors: 3, expected: { license_granted: false, repeat_theory: false, repeat_practical: true, lessons_needed: false } },
        { theory_score: 85, practical_errors: 4, expected: { license_granted: false, repeat_theory: false, repeat_practical: true, lessons_needed: false } },
        { theory_score: 85, practical_errors: 400, expected: { license_granted: false, repeat_theory: false, repeat_practical: true, lessons_needed: false } },
      ].each do |example|
        it "requires repeated practical exam when theory score: #{example[:theory_score]} and practical errors: #{example[:practical_errors]}" do
          exam_result = DriversLicense.exam_result(example[:theory_score], example[:practical_errors])
          expect(exam_result).to eq(example[:expected])
        end
      end
    end

    context 'more lessons required' do
      [
        { theory_score: 84, practical_errors: 3, expected: { license_granted: false, repeat_theory: false, repeat_practical: false, lessons_needed: true } },
        { theory_score: 0, practical_errors: 400, expected: { license_granted: false, repeat_theory: false, repeat_practical: false, lessons_needed: true } },
      ].each do |example|
        it "requires additional lessons when theory score: #{example[:theory_score]} and practical errors: #{example[:practical_errors]}" do
          exam_result = DriversLicense.exam_result(example[:theory_score], example[:practical_errors])
          expect(exam_result).to eq(example[:expected])
        end
      end
    end
  end
end

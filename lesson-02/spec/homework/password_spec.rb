# Password field
# A password field accepts a minimum of 6 characters and a maximum of 10 characters. Define:

# 1. Its corresponding equivalence partitions and test case values
# 2. The boundary values and resulting test case values with a 3-boundary value approach
# 3. The final list of test case values

require_relative '../../homework/password'

RSpec.describe Password do

  # Valid equivalence partition: 6 - 10 chars
  context 'positive tests' do
    context 'valid quantities' do
      [
        { passwd: "123456", expected: true }, # Valid lower boundary
        { passwd: "1234567", expected: true },
        { passwd: "12345678", expected: true }, # Valid middle boundary
        { passwd: "123456789", expected: true },
        { passwd: "1234567891", expected: true }, # Valid upper boundary
      ].each do |example|
        it "returns #{example[:expected]} for password.length: #{example[:passwd].length}" do
          expect(Password.is_valid?(example[:passwd])).to eq(example[:expected])
        end
      end
    end
  end

  # Invalid equivalence partitions: 0 - 5 and 11 - MAX INTEGER
  context 'negative tests' do
    context 'invalid quantities' do
      [
        { passwd: "", expected: false }, # Invalid lower boundary
        { passwd: "1", expected: false },
        { passwd: "123", expected: false }, # Invalid lower middle boundary
        { passwd: "12345", expected: false }, # Invalid lower boundary
        { passwd: "12345678910", expected: false }, # Invalid upper boundary
        { passwd: "123456789101", expected: false },
        { passwd: "1234567891019384083rfuegwhg894384wt4849t498g", expected: false }, # Invalid upper middle boundary
      ].each do |example|
        it "returns #{example[:expected]} for password: #{example[:passwd].length}" do
          expect(Password.is_valid?(example[:passwd])).to eq(example[:expected])
        end
      end
    end
  end
end
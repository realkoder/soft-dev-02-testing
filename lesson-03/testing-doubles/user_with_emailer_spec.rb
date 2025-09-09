require_relative '../testing-doubles/user'

RSpec.describe User do
  context 'positive tests' do
    it 'sends hello email through the emailer' do
      # Arrange
      emailer = spy("Emailer")
      user = User.new('John', 'Doe', 'john@doe.com', emailer)

      # Act
      user.send_email

      # Assert
      expect(emailer).to have_received(:send_email).with("Hello John")
    end

    it 'calls send_email and returns "Hello John"' do
      # Arrange
      emailer = spy("Emailer")
      user = User.new('John', 'Doe', 'john@doe.com', emailer)

      # Act
      allow(emailer).to receive(:send_email).and_return('Hello John')

      # Assert
      expect(user.send_email).to eq('Hello John')
    end
  end
end
RSpec.describe "User" do

  context 'positive tests' do
    it 'sends hello email' do
      # Arrange
      user = double('User', firstname: 'John', lastname: 'Doe', email: 'john@doe.com')

      # Assert
      expect(user).to receive(:send_email).with('Hello John')

      # Act
      user.send_email("Hello #{user.firstname}")
    end

    it 'sends hello email' do
      # Arrange
      user = spy('User', firstname: 'John', lastname: 'Doe', email: 'john@doe.com')

      # Act
      allow(user).to receive(:send_email).and_return("Hello #{user.firstname}")

      # Assert
      expect(user.send_email).to eq('Hello John')
    end
  end
end

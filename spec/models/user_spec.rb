require 'rails_helper'

RSpec.describe User, type: :model do
  include Devise::Test::IntegrationHelpers

  describe 'Validations' do
    it 'email should be present' do
      user = User.new(email: 'kushie@gmail.com', password: '343434')
      expect(user.email).to eq('kushie@gmail.com')
      expect(user.password).to eq('343434')
      expect(user.errors[:email]).to_not include("can't be blank")
    end
  end
end

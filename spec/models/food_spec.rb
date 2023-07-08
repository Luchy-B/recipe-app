require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.new(email: 'john@example.com', password: 'password') }
  subject { described_class.new(measurement_unit: 'grams', price: 2.5, quantity: 4, user:) }

  describe 'validations' do
    it 'validates presence of measurement_unit' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:measurement_unit]).to include("can't be blank")
    end

    it 'validates presence of price' do
      subject.price = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:price]).to include("can't be blank")
    end

    it 'validates presence of quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:quantity]).to include("can't be blank")
    end

    it 'validates numericality of price' do
      subject.price = 'abc'
      expect(subject).to_not be_valid
      expect(subject.errors[:price]).to include('is not a number')
    end

    it 'validates numericality of quantity' do
      subject.quantity = 'xyz'
      expect(subject).to_not be_valid
      expect(subject.errors[:quantity]).to include('is not a number')
    end

    it 'validates price is greater than or equal to zero' do
      subject.price = -1
      expect(subject).to_not be_valid
      expect(subject.errors[:price]).to include('must be greater than or equal to 0')
    end

    it 'validates quantity is greater than or equal to zero' do
      subject.quantity = -2
      expect(subject).to_not be_valid
      expect(subject.errors[:quantity]).to include('must be greater than or equal to 0')
    end
  end
end

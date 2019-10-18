require "test_helper"

describe User do
  describe 'validations' do
    it 'is valid when all fields are present' do
      expect(users(:georgina).valid?).must_equal true
    end
  end
end

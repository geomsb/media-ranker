require "test_helper"

describe User do
  describe 'validations' do
    it 'is valid when all fields are present' do
      expect(users(:georgina).valid?).must_equal true
    end
  end

  describe 'relationship' do
    it 'can vote' do
      user = users(:claudia)
      work = works(:hello)
      vote = Vote.create(date: Time.parse("Thu Nov 29 14:33:20 2019"), user_id: user.id, work_id: work.id)
      expect(vote.user.id).must_equal user.id
    end
  end
end

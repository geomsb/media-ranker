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

  describe 'spotlight' do
    it 'returns the work with more votes' do
      user = users(:georgina)
      work = works(:hello)
      vote = Vote.create(date: Time.parse("Thu Nov 29 14:33:21 2019"), user_id: user.id, work_id: work.id)
      user = users(:claudia)
      work = works(:hello)
      vote = Vote.create(date: Time.parse("Thu Nov 29 14:33:20 2019"), user_id: user.id, work_id: work.id)
      user = users(:claudia)
      work = works(:world)
      vote = Vote.create(date: Time.parse("Thu Nov 29 14:33:22 2019"), user_id: user.id, work_id: work.id)
      
      expect(Vote.spotlight).must_equal works(:hello)
    end
  end 
  
  describe 'top_ten' do
    it 'returns the top ten works' do
      user = users(:georgina)
      work = works(:hello)
      vote = Vote.create(date: Time.parse("Thu Nov 29 14:33:21 2019"), user_id: user.id, work_id: work.id)
      user = users(:claudia)
      work = works(:hello)
      vote = Vote.create(date: Time.parse("Thu Nov 29 14:33:20 2019"), user_id: user.id, work_id: work.id)
      user = users(:claudia)
      work = works(:world)
      vote = Vote.create(date: Time.parse("Thu Nov 29 14:33:22 2019"), user_id: user.id, work_id: work.id)
      
      expect(Vote.top_ten("album").count).must_equal 
    end
  end
end

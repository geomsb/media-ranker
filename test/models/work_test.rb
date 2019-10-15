require "test_helper"

describe Work do
  describe 'validations' do
    before do
      @work = Work.new(category: "album",	title: "Hello", creator:"Georgina",	publication_year:1989, description: "et expedita non aut quo")
    end

    it 'is valid when all fields are present' do
      expect(@work.valid?).must_equal true
    end

    it 'is invalid without a category' do
      @work.category = nil
      expect(@work.valid?).must_equal false
      expect(@work.errors.messages).must_include :category
    end
  end

    it "is invalid if another book has the same title" do
      work1 = Work.new(category: "album",	title: "Hello", creator:"Georgina",	publication_year:1989, description: "et expedita non aut quo")
      work2 = Work.new(category: "album",	title: "Hello", creator:"Clau",	publication_year:1989, description: "et expedita non aut quo")
      work1.save
      work2.save

      expect(work2.valid?).must_equal false
      expect(work2.errors.messages).must_include :title
    end

    it 'is invalid without a proper publication year' do
      work3 = Work.new(category: "album",	title: "Hello", creator:"Clau",	publication_year:1989, description: "et expedita non aut quo")
      work3.publication_year = "abc"

      expect(work3.valid?).must_equal false
      expect(work3.errors.messages).must_include :publication_year

      work3.publication_year = nil

      expect(work3.valid?).must_equal false
      expect(work3.errors.messages).must_include :publication_year

      work3.publication_year = 5

      expect(work3.valid?).must_equal false
      expect(work3.errors.messages).must_include :publication_year
    end

  it "retruns a list of all the works related to the album category" do
    work4 = Work.new(category: "album",	title: "Hello", creator:"Clau",	publication_year:1989, description: "et expedita non aut quo")
    work5 = Work.new(category: "movies",	title: "Hello", creator:"Clau",	publication_year:1989, description: "et expedita non aut quo")
    work4.save
    work5.save

    expect{Work.albums_work}.must_equal 1
  end
end

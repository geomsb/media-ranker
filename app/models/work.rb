class Work < ApplicationRecord
  validates :category, :title, :creator, :publication_year, :description, presence: true

  def self.albums_work
    return self.where(category: "album")
  end

  def self.books_work
    return self.where(category: "book")
  end

  def self.movies_work
    return self.where(category: "movie")
  end
end

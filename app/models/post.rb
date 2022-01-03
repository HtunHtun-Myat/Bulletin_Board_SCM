class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  paginates_per 5

  def self.search(query)
		where(["title LIKE ?", "%#{query}%"])
	end

end

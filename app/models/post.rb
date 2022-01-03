class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  def self.search(query)
		where(["title LIKE ?", "%#{query}%"])
	end

end

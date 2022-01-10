class Post < ApplicationRecord
  # validates :title, presence: true
  # validates :description, presence: true

  validates_presence_of :title, on: :create, message: "can't be blank"
  validates :description, presence: true, length: { minimum: 10 }

  paginates_per 5

  def self.search(query)
		where(["title LIKE ?", "%#{query}%"])
	end

end

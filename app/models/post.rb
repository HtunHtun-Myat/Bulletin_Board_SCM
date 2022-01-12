class Post < ApplicationRecord
  
  validates_presence_of :title, on: :create, message: "can't be blank"
  validates :description, presence: true, length: { minimum: 10 }

  paginates_per 5

  def self.search(query, user_id)
    if User.is_admin(user_id)
        where(["title LIKE ?", "%#{query}%"])
    else
        where(["title LIKE ?", "%#{query}%"]).where(:create_user_id => user_id)
    end
  end
end

class User < ApplicationRecord
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true

  has_secure_password
  validates :password, :length => {:within => 8..16}, :on => :create
  validates :password, :length => {:within => 8..16}, :on => :update, :allow_blank => true

  paginates_per 5

  def self.search(query)
    where(["name LIKE ?", "%#{query}%"])
  end

  def self.is_admin(user_id)
    user_id == 1
  end
end

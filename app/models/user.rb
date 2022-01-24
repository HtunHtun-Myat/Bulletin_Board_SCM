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

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.forgot_password(self).deliver_now# This sends an e-mail with a link for the user to reset the password
  end
  
  # This generates a random password reset token for the user
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end

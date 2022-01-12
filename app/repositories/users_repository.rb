class UsersRepository
  # get users
  def self.get_users(page, user_id)
    if User.is_admin(user_id)
      @users = User.page page
    else
      @users = User.find(user_id)
    end
  end

  # search user
  def self.search_user(page, search)
    @users = User.search(search).page page
  end
end
class UsersService
  # get users
  def self.get_users(page, user_id)
    @users = UsersRepository.get_users(page, user_id)
  end

  # search user
  def self.search_user(page, search)
    @users = UsersRepository.search_user(page, search)
  end
end
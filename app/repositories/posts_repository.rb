class PostsRepository
  # Get All Post List
  def self.get_posts(page, user_id)
    if User.is_admin(user_id)
        @post = Post.page page
    else
        @posts = Post.where('create_user_id = ?', user_id).page page
    end
  end

  # Get Post Detail
  def self.get_post(id)
    @post = Post.find(id)
  end

  # Edit Post
  def self.edit_post(id)
    @post = Post.find(id)
  end

  # Create new Post
  def self.create_post(post_params, user_id)
    post = Post.new(post_params)
    post.status = 1
    post.create_user_id = user_id
    post.updated_user_id = user_id
    post.updated_at = Time.now
    @post = post
  end

  # Update post
  def self.update_post(id)
    @post = Post.find(id);
  end

  # Delete post
  # param id
  def self.delete_post(id)
    @post = Post.find(id)
    if @post.present?
      @post.destroy
    end
  end

  # Search post
  def self.search_post(search, page, user_id)
    @posts = Post.search(search, user_id).page page
  end

   # csv export
  def self.export_csv(user_id)
    if User.is_admin(user_id)
      @posts = Post.all
    else
      @posts = Post.where(:create_user_id => user_id)
    end
  end
end

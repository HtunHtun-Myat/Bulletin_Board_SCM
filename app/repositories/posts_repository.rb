class PostsRepository
  # Get All Post List
  def self.getPostList
    @posts = Post.all
  end

  # Get Post Detail
  def self.getPostDetail(id)
    @post = Post.find(id)
  end

  # Edit Post
  def self.postEdit(id)
    @post = Post.find(id)
  end

  # Create new Post
  def self.createPost(post)
    isSavePost = post.save
  end

  # Update post
  def self.updatePost(post_params)
    isUpdatePost = Post.update(post_params)
  end

  # Delete post
  # param id
  def self.deletePost(id)
    @post = Post.find(id)
    if @post.present?
      @post.destroy
    end
  end

end
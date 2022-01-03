class PostsRepository
  # Get All Post List
  def self.getPostList(page)
    @posts = Post.page page
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
  def self.updatePost(post_params, id)
    post = Post.find(id);
    isUpdatePost = post.update(post_params)
  end

  # Delete post
  # param id
  def self.deletePost(id)
    @post = Post.find(id)
    if @post.present?
      @post.destroy
    end
  end

  # Search post
  def self.searchPostList(search, page)
    @posts = Post.search(search).page page
  end

end
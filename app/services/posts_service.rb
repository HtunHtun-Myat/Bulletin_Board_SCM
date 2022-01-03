class PostsService
    # post list
    def self.postList
      @posts = PostsRepository.getPostList
    end

    # post detail
    def self.postDetail(id)
      @post = PostsRepository.getPostDetail(id)
    end

    # post edit
    def self.postEdit(id)
      $post = PostsRepository.postEdit(id)
    end 
    
    # Create new Post
    # params post_params
    # return isSavePost
    def self.createPost(post_params)
      post = Post.new(post_params)
      post.status = 1 # default when create
      post.create_user_id = 1 #It will change when user is created
      post.updated_user_id = 1 #It will change when user is created
      post.updated_at = Time.now
      isSavePost = PostsRepository.createPost(post)
    end

    # Update post
    # params post_params
    # return isUpdatePost
    def self.updatePost(post_params)
      # post = Post.new(post_params)
      # post.status = 1 # default when create
      # post.create_user_id = 1 #It will change when user is created
      # post.updated_user_id = 1 #It will change when user is created
      # post.updated_at = Time.now
      isUpdatePost = PostsRepository.updatePost(post_params)
    end

    # Delete post
    # param id
    def self.deletePost(id)
      PostsRepository.deletePost(id)
    end
end
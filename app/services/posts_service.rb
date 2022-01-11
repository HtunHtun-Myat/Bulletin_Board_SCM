class PostsService
    # post list
    def self.postList(page)
      @posts = PostsRepository.getPostList(page)
    end

    # post detail
    def self.postDetail(id)
      @post = PostsRepository.getPostDetail(id)
    end

    # post edit
    def self.postEdit(id)
      @post = PostsRepository.postEdit(id)
    end 
    
    # Create new Post
    # params post_params
    def self.createPost(post_params, user_id)
      @post = PostsRepository.createPost(post_params, user_id)
    end

    # Update post
    # params post_params
    def self.updatePost(post_params, id)
      @post = PostsRepository.updatePost(post_params, id)
    end

    # Delete post
    # param id
    def self.deletePost(id)
      PostsRepository.deletePost(id)
    end

    # Search post
    def self.searchPostList(search, page)
      @posts = PostsRepository.searchPostList(search, page)
    end
end
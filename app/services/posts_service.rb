class PostsService
    # post list
    def self.get_posts(page, user_id)
      @posts = PostsRepository.get_posts(page, user_id)
    end

    # post detail
    def self.get_post(id)
      @post = PostsRepository.get_post(id)
    end

    # post edit
    def self.edit_post(id)
      @post = PostsRepository.edit_post(id)
    end 
    
    # Create new Post
    # params post_params
    def self.create_post(post_params, user_id)
      @post = PostsRepository.create_post(post_params, user_id)
    end

    # Update post
    # params post_params
    def self.update_post(id)
      @post = PostsRepository.update_post(id)
    end

    # Delete post
    # param id
    def self.delete_post(id)
      PostsRepository.delete_post(id)
    end

    # Search post
    def self.search_post(search, page, user_id)
      @posts = PostsRepository.search_post(search, page, user_id)
    end

    # csv export
    def self.export_csv(user_id)
      @posts = PostsRepository.export_csv(user_id)
    end
    
end
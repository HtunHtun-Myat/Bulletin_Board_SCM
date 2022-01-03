class PostsController < ApplicationController
  # index post list
  def index
    if params[:search]
      @posts = PostsService.searchPostList(params[:search])
    else
      @posts = PostsService.postList
    end
  end

  # Post Detail
  def show
    @post = PostsService.postDetail(params[:id])
  end

  # New Post form
  def new
    @post = Post.new
  end

  # Edit Post form
  def edit
    @post = PostsService.postEdit(params[:id])
  end

  # Create a new Post
  def create
    isSavePost = PostsService.createPost(post_params)
    if isSavePost
      redirect_to root_path
    else
      render :new
    end
  end

  # Update post
  def update
    isUpdatePost = PostsService.updatePost(post_params)
    if isUpdatePost
      redirect_to root_path
    else
      render :edit
    end
  end

  # Delete post
  def destroy
    PostsService.deletePost(params[:id])
    redirect_to root_path
  end

  # post parameters
  def post_params
    params.require(:post).permit(:title, :description, :status, :create_user_id, :updated_user_id, :updated_at)
  end
end

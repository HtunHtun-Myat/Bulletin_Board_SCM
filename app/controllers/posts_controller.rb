require "csv"

class PostsController < ApplicationController
  # index post list
  def index
    if params[:search]
      @posts = PostsService.searchPostList(params[:search], params[:page])
    else
      @posts = PostsService.postList(params[:page])
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
    user_id = session[:user_id]
    @post = PostsService.createPost(post_params, user_id)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # Update post
  def update
    @post = PostsService.updatePost(post_params, params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :updated, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end  
  end

  # Delete post
  def destroy
    PostsService.deletePost(params[:id])

    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully deleted.' }
      format.json { render :show, status: :deleted }
    end  
  end

  # csv export
  def export
    @posts = Post.all
    
    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=posts.csv"
      end
    end
  end

  # post parameters 
  def post_params
    params.require(:post).permit(:title, :description, :status, :create_user_id, :updated_user_id, :updated_at)
  end
end

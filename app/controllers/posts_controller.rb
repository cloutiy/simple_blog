class PostsController < ApplicationController
  #before_action :authenticate_user, only: %i[edit, update]
  #before_action :login_user, only: %i[new, create]

  def index
    @posts = Post.all
  end

  def new
    # Should not be able to create post unless logged in
    # Just redrect to login unless user already logged in
    verify_user_logged_in
    
    @post = Post.new
  end

  def create
    # Should not be able to create post unless logged in
    # Just redrect to login unless user
    verify_user_logged_in

    @post = Post.new(post_params)
    @post.user_id = session[:user_id]

    if @post.save
      redirect_to @post
    else
      flash[:alert] = "Some problem saving the post."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    # Can only update post if:
    # 1) logged in 
    # 2) post belongs to the logged in user

    verify_user_logged_in
    @post = Post.find(params[:id])

    if @post.user_id != session[:user_id]
      flash[:notice] = "You are not authorized to modify this post."
      redirect_to post_path(@post)
    else
      @post
    end
  end

  def update
    # Can only update post if:
    # 1) logged in 
    # 2) post belongs to the logged in user

    verify_user_logged_in

    @post = Post.find(params[:id])

    if @post.user_id != session[:user_id]
      flash[:notice] = "You are not authorized to modify this post."
      redirect_to post_path(@post)

    elsif  @post.update(post_params)
      redirect_to post_path(@post)
    
    else
      flash[:alert] = "Couldn't save the changes."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private 
  def post_params
    params.require(:post).permit(:title, :body)
  end

  private 
  def verify_user_logged_in
    user = User.find_by(id: session[:user_id])
    
    flash[:notice] = "Please log in to access this feature."

    redirect_to new_login_path unless user
  end
end

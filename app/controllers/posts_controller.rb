class PostsController < ApplicationController
  before_action :signed_in?, only: [:new, :create]

  def new
    @posts = Post.new
  end

  def create
    
    @posts = Post.new(content: params[:content], user_id: session[:user_id])
    @posts.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
    @logged_in = signed_in? 
  end

end

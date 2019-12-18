class PostsController < ApplicationController
  before_action :signed_in?, only: [:new, :create]

  def new
    @posts = Post.new
  end

  def create
    redirect_to root_url
  end

  def index
  end

end

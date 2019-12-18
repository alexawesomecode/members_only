class SessionsController < ApplicationController
  def new; end

  def index
    @user = User.find_by(email: current_user.email) unless current_user.nil?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # Log the user in and redirect to the user's show page.
      sign_in user
      current_user
      redirect_to root_url
    else
      # Create an error message.
      flash.now.alert = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    @current_user = nil
    session[:user_id] = nil
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    render 'new'
  end
end

class SessionsController < ApplicationController
  def index
  end


  def new
   # @session = session[:blank]
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      sign_in user
      current_user
      redirect_to root_path
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      # redirect_to root_url
      render 'new'
    end
  end

  
  def delete

	  log_out if @current_user == nil

end

end

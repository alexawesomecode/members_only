class ApplicationController < ActionController::Base
  attr_accessor :current_user

  def sign_in(user)
    token = User.new_token
    user.update_remember_token(token)
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent.signed[:remember_token] = user.remember_token
  end

  def current_user
      if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: user_id)
      elsif (user_id = cookies.signed[:user_id])
        user = User.find_by(id: user_id)
        if user && user.authenticate(cookies[:remember_token])
          sign_in user
          @current_user = user
        end
      end
    end

  def current_user?(user)
    user == current_user
  end

  private

    def signed_in?
      return !current_user.nil?
    end

end

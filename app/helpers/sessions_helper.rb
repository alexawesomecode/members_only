module SessionsHelper
  def log_out
    @current_user = nil
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end

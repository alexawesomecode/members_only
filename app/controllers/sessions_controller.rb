class SessionsController < ApplicationController
  def index
  end

  def new
   @session = session[:blank]
  end

end

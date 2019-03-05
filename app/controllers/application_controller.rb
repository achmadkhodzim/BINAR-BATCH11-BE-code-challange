class ApplicationController < ActionController::Base
  def authenticate_user
    if session[:user_id]
      # set current user object to @current_user object variable
      @current_user = User.find session[:user_id]
      true
    else
      redirect_to '/login'
      false
    end
  end
  def authenticate_admin
    if session[:user_id]
      # set current user object to @current_user object variable
      @current_user = User.find session[:user_id]
      if @current_user.role ==1
      true
      else
      false
      end

    else
      redirect_to '/login'
      false
    end
  end
end

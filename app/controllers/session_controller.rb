class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user.present? && user.password == params[:session][:password]
      # Log the user in and redirect to the user's show page.
      session[:user_id] = user.id
      if user.role ==1
        session[:admin] = user.id
      end
      redirect_to '/books'
    else
      # Create an error message.
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to '/login'
  end
end

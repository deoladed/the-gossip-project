class SessionsController < ApplicationController
  def new
  end

  def create
  	my_user = User.find_by(email: params[:email])

  	if my_user && my_user.authenticate(params[:password])
  	session[:user_id] = my_user.id
  	redirect_to potins_path

  	else
  	flash[:alert] = 'Mail ou password incorrect'
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  	end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_connexion_path
  end
end

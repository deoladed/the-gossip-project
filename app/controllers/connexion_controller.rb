class ConnexionController < ApplicationController
  def index
  end

  def new
  end

  def create
    my_user = User.find_by(email: params[:email])

    if my_user && my_user.authenticate(params[:password])
    flash[:notice] = 'Vous etes connecte'
    session[:user_id] = my_user.id
  	redirect_to potins_path

  	else
  	flash[:alert] = 'Mail ou password incorrect'
    render 'new'
  	end
  end

  def destroy
  	session.delete(:user_id)
    redirect_to new_connexion_path
  end
end

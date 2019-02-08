class ConnexionController < ApplicationController
  def index
  end

  def new
  end

  def create
    my_user = User.find_by(email: params[:email].downcase)

    if my_user && my_user.authenticate(params[:password])
    flash[:notice] = 'Vous etes connecte'
    log_in my_user
    params[:remember_me] == '1' ? remember(my_user) : forget(my_user)
    redirect_to potins_path

  	else
  	flash[:alert] = 'Mail ou password incorrect'
    render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
    redirect_to new_connexion_path
  end
end

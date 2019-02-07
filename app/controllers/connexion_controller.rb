class ConnexionController < ApplicationController
  def index
#   	 controller les méthodes 
#  .find_by(email: xx) (pour identifier l'utilisateur d'après son e-mail) et .authenticate(xxxx) (pour vérifier si le mot de passe correspond).

# Si on trouve bien un utilisateur à cet e-mail et que le mot de passe correspond, on peut le laisser se connecter en ouvrant une session avec session[:user_id] = my_user.id. Reporte-toi à la ressource sur les sessions pour en savoir plus.
  end

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

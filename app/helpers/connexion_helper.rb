module ConnexionHelper
	 def current_user
    User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
    redirect_to potins_path
  end

  def logged_in?
  	true unless	session[:user_id].nil?
  end
end

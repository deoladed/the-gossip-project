class UserController < ApplicationController
  def show
  	@user = Potin.all.find(params[:potin_id]).user  	
  end

  def create
  	 @user = User.new(first_name: params[:blase], city: City.all.sample)

    if @user.save
    flash[:notice] = "L'user a ete cree avec succes! Vous pouvew maintenant creer des potins, liker et commenter"
    redirect_to potins_path
    else
   	flash[:alert] = "Fails"
   	redirect_to welcome_path
    end
  end
end

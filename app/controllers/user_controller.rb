class UserController < ApplicationController
  def show
  	@user = Potin.all.find(params[:potin_id]).user
  end

  def new
    @user = User.new
    @city = City.all.map { |city| city.name }
  end

  def create
  	@user = User.new(first_name: params[:first_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], city: City.all.sample, description: params[:description])

    if @user.save
    flash[:notice] = "L'user a ete cree avec succes! Vous pouvez maintenant creer des potins, liker et commenter"
    log_in(@user)
    else
   	flash[:alert] = "Fails"
   	redirect_to welcome_path
    end
  end

  def index
    @user = User.all
  end

  def potins
    @user = User.find(params[:id])   
  end
end

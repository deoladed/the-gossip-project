class PotinsController < ApplicationController
    before_action :authenticate_user, only: [:index, :new]

  def index
    @potins = Potin.all.reverse
  end

  def show
    @lepotin = Potin.all.find(params[:id])
    @lecomment = Comment.new
  end

  def create
    @potin = Potin.new(title: params[:Potin_title], content: params[:Potin_text], user: current_user, date: Time.now.to_date)
    @potin.tags << Tag.where(title: params[:Tag])    

    if @potin.save
      flash[:notice] = "Votre potin a ete cree avec succes! Merci de votre mechancete, continuez a vous lacher sur vos collegues !"
      redirect_to potin_path(@potin.id)
    else
      render new_potin_path
    end
  end

  def new
    @potin = Potin.new
    @tag = [] 
    Tag.all.each {|tag| @tag << tag.title }
  end

  def edit
    @lepotin = Potin.all.find(params[:id])
  end

  def update
    @lepotin = Potin.all.find(params[:id])
    post_params = params.require(:potin).permit(:title, :content)

    if @lepotin.update(post_params)
      redirect_to @lepotin
    else
      puts @lepotin.errors.full_messages
      render :edit
    end
  end
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)


  def destroy
    @lepotin = Potin.all.find(params[:id])
    @lepotin.destroy
    flash[:notice] = 'Potin supprime'
    redirect_to potins_path
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end

private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_connexion_path
    end
  end


end

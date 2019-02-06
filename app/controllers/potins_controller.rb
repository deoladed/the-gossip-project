class PotinsController < ApplicationController
  def index
    @potins = Potin.all.reverse
    # @user = User.new(first_name: params[:blase], city: City.all.sample) unless params[:blase].nil?
    # if @user.save
    # flash[:notice] = "L'user a ete cree avec succes! Vous pouvew maintenant creer des potins, liker et commenter"
    # else
    #   render      
    # end
  end

  def show
    @lepotin = Potin.all.find(params[:id])
   end

  def create
    @potin = Potin.new(title: params[:Potin_title], content: params[:Potin_text], user: User.last, date: Time.now.to_date)

    if @potin.save
      flash[:notice] = "Votre potin a ete cree avec succes! Merci de votre mechancete, continuez a vous lacher sur vos collegues !"
      redirect_to potins_path
    else
      render new_potin_path
    end
  end

  #   Like.create(user: User.all.last, likeable: Potin.find(params[:id])) if params[:commit] == 'Liker'

  def new
    @potin = Potin.new
  end

  def edit
  end
  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end

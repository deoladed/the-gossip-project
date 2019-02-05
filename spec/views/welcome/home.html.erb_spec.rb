require 'rails_helper'

RSpec.describe "welcome/home.html.erb", type: :view do

context 'it says welcome' do
  it "displays 'welcome'" do
    # dit à la view que @user sera le build d'un utilisateur avec "lol@email.com" comme email
    assign(:user, build(:user, email: "lol@email.com"))

    # génère la vue (ceci doit être fait après avoir assigné la variable d'instance, pour qu'il puisse la trouver)
    render
    
    # la vue rendered doit afficher l'email passé
    expect(rendered).to match /lol@email.com/
  end
end

context 'when there are cities' do  
  it 'displays the details' do
    # déclare la variable cities, qui est une array contenant des villes
    assign(:cities,
      [
        build(:city, name: "Bordeaux"),
        build(:city, zip_code: "34000"),
        build(:city),
        build(:city)
      ]
    )

    render

    # vérifie que le name d'une des villes soit affiché
    expect(rendered).to match /Bordeaux/

    # vérifie que le zip_code d'une ville soit affiché
    expect(rendered).to match /34000/
  end
end
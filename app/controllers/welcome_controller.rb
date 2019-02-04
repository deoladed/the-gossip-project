class WelcomeController < ApplicationController

  def home
  	@potins = Potin.all
  	unless params[:blase].nil?
  	User.create(first_name: params[:blase], city: City.all.sample)
      end
    end
  def askname
  end

end

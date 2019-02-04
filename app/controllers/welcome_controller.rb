class WelcomeController < ApplicationController

  def home
  	@potins = Potin.all
  	@name = params[:blase]
      end
  def askname
  	@name = 'toi'
  	# User.create(first_name: params[:blase], city: City.all.sample)
  end

end

class WelcomeController < ApplicationController

  def askname
  	@user = User.new
  	@city = City.all.map { |city| city.name }
  end

end

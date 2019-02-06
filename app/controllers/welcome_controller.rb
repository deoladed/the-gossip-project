class WelcomeController < ApplicationController

  def askname
  	@user = User.new
  end

end

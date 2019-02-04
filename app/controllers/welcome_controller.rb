class WelcomeController < ApplicationController
  def home
  	@potins = Potin.all
  	@name = 'toi'
  end
end

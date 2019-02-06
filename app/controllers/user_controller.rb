class UserController < ApplicationController
  def show
  	@user = Potin.all.find(params[:potin_id]).user  	
  end
end

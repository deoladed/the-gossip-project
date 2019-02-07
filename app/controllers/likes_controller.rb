class LikesController < ApplicationController
  def create
  	p '444444444444444444'
  	p params
  	p '444444444444444444444444444'
  	Like.create(user: current_user, likeable: Potin.find(params[:id])) unless params[:commit].nil?
  redirect_to potin_path(params[:id])
  end
end

class PotinsController < ApplicationController
  def show
    puts '#' *30
    p params
    puts '#' *30
  	@potins = Potin.all
    Comment.create(user: User.all.last, content:params[:comment], commenteable: Potin.find(params[:id])) unless params[:user].nil? && params[:comment].nil?
  
    Like.create(user: User.all.last, likeable: Potin.find(params[:id])) if params[:commit] == 'Liker'

  end

  def user
  	@potins = Potin.all
  end

  def create
  end

  def edit
  end
end

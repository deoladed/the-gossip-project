class PotinsController < ApplicationController
  def show
  	@potins = Potin.all
    unless params[:user].nil? && params[:comment].nil?
      Comment.create(user: User.all.last, content:params[:comment], commenteable: Potin.find(params[:id])) 
    end
  end

  def user
  	@potins = Potin.all
  end

  def create
  end

  def edit
  end
end

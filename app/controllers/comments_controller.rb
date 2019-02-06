class CommentsController < ApplicationController
  def create
  	Comment.create(user: User.all.last, content:params[:Comment_text], commenteable: Potin.find(params[:potin_id])) unless params[:Comment_text].nil?
  	redirect_to potin_path(params[:potin_id])
  end
end

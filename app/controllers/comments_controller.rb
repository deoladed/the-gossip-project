class CommentsController < ApplicationController
	def create

		@comment = Comment.create(user: User.all.last, content:params[:Comment_text], commenteable: Potin.find(params[:potin_id]))

		if @comment.save
			flash[:notice] = "Commentaire cree avec succes"
			redirect_to potin_path(params[:potin_id])
		else
			flash[:alert] = "Fails"
			redirect_to potin_path(params[:potin_id])
		end
	end
end

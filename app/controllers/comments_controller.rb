class CommentsController < ApplicationController
	def create
		@comment = Comment.create(user: current_user, content:params[:Comment_text], commenteable: Potin.find(params[:potin_id]))

		if @comment.save
			flash[:notice] = "Commentaire cree avec succes"
			redirect_to potin_path(params[:potin_id])
		else
			flash[:alert] = "Fails, commentaire non cree"
			redirect_to potin_path(params[:potin_id])
		end
	end

	def edit
		@lecomment = Comment.find(params[:id])

		# render :edit
	end

	def update
	  @lecomment = Comment.find(params[:id])
    post_params = params.require(:comment).permit(:content)

    if @lecomment.update(post_params)
      redirect_to potin_path(Comment.find(params[:id]).commenteable_id)
    else
      puts @lecomment.errors.full_messages
      render :edit
    end
	end

	def destroy
		potin = []
		potin << Comment.find(params[:id]).commenteable_id

	  @lecomment = Comment.find(params[:id])
    @lecomment.destroy

    redirect_to potin_path(potin)
	end
end

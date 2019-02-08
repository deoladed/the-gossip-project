class LikesController < ApplicationController
   
  def create

  	if params[:format].nil?
 			 	if current_user.likes.find_by(likeable_type: 'Comment', likeable_id: params[:monparams][:comment_id]).nil?
   				flash[:notice] = 'You like it !'
  				Like.create(user: current_user, likeable: Comment.find(params[:monparams][:comment_id]))
  				redirect_to potin_path(params[:monparams][:potin_id])
  			else
  				flash[:notice] = "You don't like it !"
  				Like.find_by(user: current_user, likeable: Comment.find(params[:monparams][:comment_id])).destroy
  				redirect_to potin_path(params[:monparams][:potin_id])
  			end
  	else
  			if current_user.likes.find_by(likeable_type: 'Potin', likeable_id: params[:format]).nil?
  				flash[:notice] = 'You like it !'
  				Like.create(user: current_user, likeable: Potin.find(params[:format]))
  				redirect_to potin_path(params[:format])
  			else
  				flash[:notice] = "You don't like it !"
  				Like.find_by(user: current_user, likeable: Potin.find(params[:format])).destroy
  				redirect_to potin_path(params[:format])
  			end
  	end
  end
end
			
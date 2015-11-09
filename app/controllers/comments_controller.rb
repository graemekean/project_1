class CommentsController < ApplicationController
  def create

    params[:commenter] = current_user.email
     @photo = Photo.find(params[:photo_id])

     @comment = @photo.comments.create(comment_params)
     redirect_to photo_path(@photo)
     
   end
  
   private
     def comment_params
       params.require(:comment).permit(:commenter, :body)
     end


end

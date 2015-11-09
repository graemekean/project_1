class CommentsController < ApplicationController
  def create

     @photo = Photo.find(params[:photo_id])
      params[:comment][:commenter] = current_user.email

     
     @comment = @photo.comments.create(comment_params)
     redirect_to photo_path(@photo)
     
  end
  
   private
     def comment_params
       # params[:comment][:commenter] = current_user.email
       params.require(:comment).permit(:commenter, :body)
     end


end

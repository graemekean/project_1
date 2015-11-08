class CommentsController < ApplicationController
   before_filter :authenticate_user!


  def home
  @comments = current_user.comments.all
    
  end

  def index

    load_comments
  
end

def show
  load_comment
  @comments = @photo.comments.all
  @photo = Photo.find(params[:id])
end

def new

    # @photo = Photo.find(params[:id])
    load_photo
  @comment = Comment.new
  # load_comments


end

def create
  
 

    @photo = Photo.all.find(params[:id])


  @photo.comments.create(comment_params)
  redirect_to(comments_path)
end

def destroy
  load_comment  #doesn't need @ since it is not exposed - only being deleted
  @comment.destroy
  redirect_to(comments_path)
end

def edit
  load_photo
  @comments = @photo.comments.all


end

def update
  load_comment #again - the data does not need to be exposed - no @
  @comment.update(comment_params) #from the private method below - whitelist check
  redirect_to(comments_path)
end  

private

def load_comment
  @comment = current_user.comments.find(params[:id])
end

def load_photo
    @photo = Photo.all.find(params[:id])

  end

def load_comments
  @comments = Comment.all
end

def comment_params

  # allows these params to be accessed by the methods above
  params.require(:comment).permit(:photo_id, :user_id, :content, :created_at)
end

end
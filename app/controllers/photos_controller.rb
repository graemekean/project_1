class PhotosController < ApplicationController


  def index
    @photos = current_user.photos.all
    @albums = current_user.albums.all
    # @photo = current_user.photos.find(params[:id])
    



  end

  def show
    @photo = current_user.photos.find(params[:id])
    @photos = current_user.photos.all
    @albums = current_user.albums.all

  end

  def new
    @photo = Photo.new
    @photos = current_user.photos.all

  # @comments = Comment.all

  
  end

  def create

    # if request.post?
    #   @recipe = Recipe.new(params[:recipe])
    #   @recipe.save
    # else
    #   Recipe.create(recipe_params)   #see the team_params from the private method below
    #   redirect_to(recipes_path)
    # end
    params[:user_id] = current_user.id

    current_user.photos.create(photo_params)   #see the team_params from the private method below
    redirect_to(photos_path)

  end


  def destroy
    photo = current_user.photos.find(params[:id])  #doesn't need @ since it is not exposed - only being deleted
    photo.destroy
    redirect_to(photos_path)
  end

  def edit
    params[:user_id] = current_user.id

    @photo = current_user.photos.find(params[:id])
    @albums = current_user.albums.all

    @comments = @photo.comments.all
  # if @recipe
  #   if request.post?
  #     raise
  #     if @recipe.update_attributes(recipe)
  #       flash.now[:message]="Update successful"
  #     end
  #   end
  # else
  #   flash[:message]="page cannot be shown"
  # end
  end



  def update

    params[:user_id] = current_user.id


    photo = current_user.photos.find(params[:id]) #again - the data does not need to be exposed - no @
    photo.update(photo_params) #from the private method below - whitelist check
    # redirect_to(recipes_path)
    redirect_to(photos_path)




  end  

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

private
def photo_params
  # allows these params to be accessed by the methods above
  params.require(:photo).permit(:album_id, :favourite, :date_uploaded, :rating, :photo_image, :title, :caption, :user_id)

   # ingredient_ids:[])
end

end
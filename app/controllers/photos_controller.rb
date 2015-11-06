class PhotosController < ApplicationController

  def index
    @photos = Photo.all
    @albums = Album.all

  #@countries.sort!{ |a,b| a.name.downcase <=> b.name.downcase }
  #@country = Country.find(params[:id])
end

def show
  @photo = Photo.find(params[:id])
  @photos = Photo.all
  @albums = Album.all
end

def new
  @photo = Photo.new
  @photos = Photo.all
  # @comments = Comment.all

  # if !request.post?
  #   @ingredients = Ingredient.all
    
  # else
  #  @ingredients = params[:ingredient_ids].collect{|id| id.to_i} 
  # end
end

def create

  # if request.post?
  #   @recipe = Recipe.new(params[:recipe])
  #   @recipe.save
  # else
  #   Recipe.create(recipe_params)   #see the team_params from the private method below
  #   redirect_to(recipes_path)
  # end
  Photo.create(photo_params)   #see the team_params from the private method below
  redirect_to(photos_path)

end


def destroy
  photo = Photo.find(params[:id])  #doesn't need @ since it is not exposed - only being deleted
  photo.destroy
  redirect_to(photos_path)
end

def edit
  @photo = Photo.find(params[:id])
  @albums = Album.all
  @comments = Comment.all
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



  photo = Photo.find(params[:id]) #again - the data does not need to be exposed - no @
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
  params.require(:photo).permit(:album_id, :favourite, :date_uploaded, :rating)

   # ingredient_ids:[])
end

end
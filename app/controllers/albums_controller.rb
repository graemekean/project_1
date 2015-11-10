class AlbumsController < ApplicationController
 before_filter :authenticate_user!


 def home
  @albums = current_user.albums.all

end

def index

  load_albums
  
end

def show
  load_album
  @photos = @album.photos.all
  # @photo = Photo.find(params[:id])
end

def new
  @album = Album.new
  load_albums
end

def create

  # @album = current_user.albums.build(album_params)
  # authorize @album
  # if @album.save
  #       # to handle multiple images upload on create
  #       if params[:images]
  #         params[:images].each { |image|
  #           @album.photos.create(image: image)
  #         }
  #       end
  #       flash[:notice] = "Your album has been created."
  #       redirect_to @album
  #     else 
  #       flash[:alert] = "Something went wrong."
  #       render :new
  # end
  # OLD WAY
  params[:user_id] = current_user.id
  current_user.albums.create(album_params)
  redirect_to(albums_path)
end

def destroy
  load_album  #doesn't need @ since it is not exposed - only being deleted
  @album.destroy
  redirect_to(albums_path)
end

def edit
  load_album

end

def update
  # authorize @album
  # if @album.update(params[:album].permit(:title,:description))
  #       # to handle multiple images upload on update when user add more picture
  #       if params[:images]
  #           params[:images].each { |image|
  #           @album.photos.create(image: image)
  #           }
  #       end
  #   flash[:notice] = "Album has been updated."
  #   redirect_to @album
  # else
  #   render :edit
  # end


  #   OLD WAY
  # load_album #again - the data does not need to be exposed - no @
  # @album.update(album_params) #from the private method below - whitelist check
  # redirect_to(albums_path)
end  

private

def load_album
  @album = current_user.albums.find(params[:id])
end

def load_albums
  @albums = current_user.albums.all
end

def album_params
  # allows these params to be accessed by the methods above
  params.require(:album).permit(:title, :user_id, :status, :date_created)
end

end
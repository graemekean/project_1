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
  load_album #again - the data does not need to be exposed - no @
  @album.update(album_params) #from the private method below - whitelist check
  redirect_to(albums_path)
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
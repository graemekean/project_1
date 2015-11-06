class AlbumsController < ApplicationController
  before_filter :authenticate_user!
  def home
    load_albums
  end

  def index
    load_albums

  #@countries.sort!{ |a,b| a.name.downcase <=> b.name.downcase }
  #@country = Country.find(params[:id])
end

def show
  load_album
  @photos = Photo.all
  @photo = Photo.find(params[:id])
end

def new
  @album = Album.new
  load_albums
end

def create
  Album.create(album_params)   #see the team_params from the private method below
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
  @album = Album.find(params[:id])
end

def load_albums
  @albums = Album.all
end

def album_params
  # allows these params to be accessed by the methods above
  params.require(:album).permit(:title, :user_id, :status, :date_created)
end

end
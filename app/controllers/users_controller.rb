class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    
    # @user = User.find(params[:id])

    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    
      # load_album #again - the data does not need to be exposed - no @
      @user.update(user_params) #from the private method below - whitelist check
      redirect_to(users_path)
     
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Instagran!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :id, :name, :about_me, :date_of_birth, :profile_image)
    end
end
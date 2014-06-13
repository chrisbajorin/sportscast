class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
   if @user.save
     redirect_to root_url, :notice => "Signed up!"
   else
     render "new"
   end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password_hash, :password_salt)
  end

end

class UsersController < ApplicationController
  PER = 9
  
  def show
    @user = User.find(params[:id])
    @playlists = @user.playlists.page(params[:page]).per(PER)
  end
end

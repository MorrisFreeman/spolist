class UsersController < ApplicationController
  PER = 6

  def show
    @user = User.find(params[:id])
    @playlists = @user.playlists.page(params[:page]).per(PER).order("created_at")
  end
end

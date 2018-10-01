class FavoritesController < ApplicationController
  def create
    playlist = Playlist.find(params[:playlist_id])
    current_user.add_favorite(playlist)
    respond_to :js
  end

  def destroy
    playlist = Playlist.find(params[:playlist_id])
    current_user.delete_favorite(playlist)
    respond_to :js
  end
end

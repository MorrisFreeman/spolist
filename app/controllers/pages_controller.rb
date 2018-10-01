class PagesController < ApplicationController
  PER = 9

  def home
    @playlists = Playlist.page(params[:page]).per(PER)
  end
end

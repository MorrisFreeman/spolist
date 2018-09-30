class PagesController < ApplicationController
  def home
    @playlists = Playlist.all
  end
end

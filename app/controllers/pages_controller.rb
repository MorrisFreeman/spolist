class PagesController < ApplicationController
  PER = 9

  def home
    @playlists = Playlist.page(params[:page]).per(PER).order("created_at DESC")
  end

  def search
    if params[:search].present? && params[:search].strip != ""
      playlists = Playlist.find_by_sql("SELECT * FROM playlists where exists ( select  1 from tags where tags.playlist_id = playlists.id and tags.content LIKE '%#{params[:search]}%' order by created_at desc)")
      @playlists = Kaminari.paginate_array(playlists).page(params[:page]).per(PER)
    else
      @playlists = Playlist.page(params[:page]).per(PER).order("created_at DESC")
    end
    render "search"
  end
end

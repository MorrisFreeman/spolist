class PlaylistsController < ApplicationController
  def show
  end

  def new
  end

  def create
    @playlist = current_user.playlists.new(playlist_params)
    @playlist.tags.build(params[:tag][:content].split(",").uniq.map { |e| {content: e} })
    if @playlist.save
      redirect_to root_path, notice: "Added your playlist!"
    else
      redirect_to root_path, alert: "Add failed!"
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    @playlists = Playlist.all.page(params[:page]).per(9)
    respond_to :js
  end

  private
    def playlist_params
      params.require(:playlist).permit(:content)
    end
end

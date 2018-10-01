class PlaylistsController < ApplicationController
  def show
  end

  def new
  end

  def create
    @playlist = current_user.playlists.new(playlist_params)
    @playlist.tags.build(params[:tag][:content].split(",").map { |e| {content: e} })
    if @playlist.save
      redirect_to root_path, notice: "Added your playlist!"
    else
      redirect_to root_path, alert: "Add failed!"
    end
  end

  def destroy
  end

  private
    def playlist_params
      params.require(:playlist).permit(:content, tags_attributes: [:content, :playlist_id])
    end
end

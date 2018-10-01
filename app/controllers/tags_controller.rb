class TagsController < ApplicationController
  def create
  end

  def destroy
    @id = params[:id]
    @tag = Tag.find(@id)
    @tag.destroy
    respond_to :js
  end
end

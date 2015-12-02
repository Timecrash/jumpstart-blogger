class TagsController < ApplicationController
  def index
    @tag = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id]).destroy

    flash.notice = "Tag '#{@tag.name}' deleted!"

    redirect_to tags_path
  end
end

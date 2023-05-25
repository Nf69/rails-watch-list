class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(@bookmark_params)
    @bookmark_params.list.id = params[:list_id]
    raise
    @list = @bookmark.list
    if @bookmark.save
      redirect_to list_path(@list)
      raise
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.delete
  end

  private

  # def bookmark_params
  #   params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  # end
end

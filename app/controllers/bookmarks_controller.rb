class BookmarksController < ApplicationController
  before_action :set_list, except: [:destroy]

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if !params[:bookmark][:movie_id].empty?
      @bookmark.movie = Movie.find(params[:bookmark][:movie_id])
    end
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end

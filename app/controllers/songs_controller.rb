class SongsController < ApplicationController
  def index
    @songs = Song.all.order(:created_at)

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @songs }
    end
  end

  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html { :show }
      format.json { render json: @song }
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :album, :artist)
  end

end

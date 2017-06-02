require 'pry'

class ArtistsController < ApplicationController
  # before_action :set_artist only: [:show, :edit]
  
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs.all
    @song = @artist.songs.new

  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id]) 
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end

  private 
    def set_artist
      @artist = Artist.find(params[:id])
    end
    
    def artist_params
      params.require(:artist).permit(:name)
    end
    
end

require 'pry'

class SongsController < ApplicationController
    before_action :find_artist, only: [:destroy, :add]

    def create
        @artist = Artist.find(params[:artist_id])
        @song = @artist.songs.new(song_params)
        @song.save
        redirect_to artist_path(params[:artist_id])  
    end

    def destroy
        @song.destroy
        redirect_to artist_path(params[:artist_id])
    end

    def add
        song.billboard_id = params[:billboard_id]
        song.save

        redirect_to billboard_path(params[:billboard_id])
    end

    private

        def song_params
            params.require(:song).permit(:title)
        end

        def find_artist
            song = Song.find(params[:song_id])
        end
        

end

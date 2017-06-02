require 'pry'

class SongsController < ApplicationController


    def create

        @artist = Artist.find(params[:artist_id])
        @song = @artist.songs.new(song_params)
        @song.save
        redirect_to artist_path(params[:artist_id])
            
    end

    def destroy
        
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to artist_path(params[:artist_id])
    end

    def add
        

        song = Song.find(params[:song_id])
        song.billboard_id = params[:billboard_id]
        song.save

        redirect_to billboard_path(params[:billboard_id])
    
    end
    

    private

        def song_params
            params.require(:song).permit(:title)
        end

end

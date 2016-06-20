class SearchesController < ApplicationController
  def home
  end

  def search
    @song = params[:song_title]
    @album = params[:album_title]
    @artist = params[:artist_name]

    sql = "SELECT artists.name artist, albums.title album, songs.title song
          FROM songs
          JOIN albums ON albums.id = songs.album_id
          JOIN artists ON artists.id = albums.artist_id
          WHERE songs.title LIKE '%#{@song}%'
          AND albums.title LIKE '%#{@album}%'
          AND artists.name LIKE '%#{@artist}%'"

    if (@song && @song.length > 0) || @album && @album.length > 0 || @artist && @artist.length > 0
      @records_array = ActiveRecord::Base.connection.execute(sql)
    else
      @records_array = []
    end
  end

end

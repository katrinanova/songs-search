class Search
  def initialize(params)
    @song = params[:song_title]
    @album = params[:album_title]
    @artist = params[:artist_name]
  end

  def results
    if (@song && @song.length > 0) || (@album && @album.length > 0) || (@artist && @artist.length > 0)
      results = Song.includes(album: :artist).joins(album: :artist)
      .where(song_table[:title].matches("%#{@song}%"))
      .where(album_table[:title].matches("%#{@album}%"))
      .where(artist_table[:name].matches("%#{@artist}%"))
    else
      results = []
    end

    results
  end

  private

  def song_table
    Song.arel_table
  end

  def album_table
    Album.arel_table
  end

  def artist_table
    Artist.arel_table
  end
end

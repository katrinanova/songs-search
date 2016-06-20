# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

artists = ['Drake', 'Kaney West', 'Rihanna', 'Billy Joel', 'Prince', 'Radiohead', 'Beyonce', 'Kurt Cobain']
artists.each do |name|
  artist = Artist.create(name: name)
  5.times do |alb|
    album_name = Faker::Book.title
    album = Album.create(title: album_name, artist_id: artist.id)
    15.times do |song|
      song_name = Faker::Book.title
      Song.create(title: song_name, album_id: album.id)
    end
  end
end

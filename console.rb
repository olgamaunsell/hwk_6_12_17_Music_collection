require('pg')
require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'artist_name' => 'Stereoooophonics'
  })

artist1.save()

artist1.artist_name = "Stereophonics"

#.update not working
# artist1.update()

artist2 = Artist.new({
  'artist_name' => 'Gorillaz'
  })


artist2.save()

# artist2.delete()

album1 = Album.new({
  'title' => 'Just enough education to perform',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'title' => 'Word gets around',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })

album3 = Album.new({
  'title' => 'Demon Days',
  'genre' => 'Indie',
  'artist_id' => artist2.id
  })

album4 = Album.new({
  'title' => 'Humanz',
  'genre' => 'Indie',
  'artist_id' => artist2.id
  })

album1.save()
album2.save()
album3.save()
album4.save()

album1.delete

albums = Album.all()

artists = Artist.all()

# List all the albums they have by an artist

# Show the artist any album belongs to


binding.pry
nil

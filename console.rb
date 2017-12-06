require('pg')
require('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/album.rb')

artist1 = Artist.new({
  "artist_name" => "Dolly Parton"
  })

artist1.save()

album1 = Album.new({
  "title" => "9 to 5",
  "genre" => "Country",
  'artist_id' => artist1.id
  })

album1.save()

albums = Album.all()

artists = Artist.all()

binding.pry
nil

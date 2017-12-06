require('pry-byebug')
require_relative('../db/sql_runner.rb')

class Album

attr_reader(:id)
attr_accessor(:title, :genre, :artist_id)

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id']
  end

  def save()
    sql = "INSERT INTO albums (title, genre,artist_id)
    VALUES ($1, $2, $3)
    RETURNING id;"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()

    albums = SqlRunner.run("SELECT * FROM albums")

    return albums.map {|album| Album.new(album)}

  end

end

require('pry-byebug')
require_relative('../db/sql_runner.rb')

class Artist

attr_reader(:id)
attr_accessor(:artist_name)

  def initialize(options)
    @id = options['id'].to_i
    @artist_name = options['artist_name']
  end

  def save()
    sql = "INSERT INTO artists (artist_name)
    VALUES ($1)
    RETURNING id;"
    values = [@artist_name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()

    artists = SqlRunner.run("SELECT * FROM artists")

    return artists.map {|artist| Artist.new(artist)}

  end

end

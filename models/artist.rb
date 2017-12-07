require('pry-byebug')
require_relative('../db/sql_runner.rb')

class Artist

attr_reader(:id)
attr_accessor(:artist_name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
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

  def update()
    binding.pry
    sql = "UPDATE artists
    SET artist_name = ($1) WHERE id = $2"
    binding.pry
    values = [@artist_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def Artist.all()

    artists = SqlRunner.run("SELECT * FROM artists")

    return artists.map {|artist| Artist.new(artist)}

  end

  def Artist.delete_all()

    SqlRunner.run("DELETE FROM artists")

  end

  def Artist.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    sql_result = SqlRunner.run(sql,values)

    found_artist = sql_result.map {|artist| Artist.new(artist)}

    return found_artist[0]

  end

end

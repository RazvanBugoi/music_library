require_relative "./albums"

class AlbumRepository
  def all
    sql = "SELECT id, title, release_year, artist_id FROM albums;"
    result_set = DatabaseConnection.exec_params(sql, [])

    albums = []

    result_set.each do |record|
      album = Album.new
      album.id = record["id"]
      album.title = record["title"]
      album.release_year = record["release_year"]
      album.artist_id = record["artist_id"]

      albums << album
    end

    # puts artists.first.name
    return albums
  end

  def find(id)
    # The placeholder $1 is a "parameter" of the SQL query.
    # It needs to be matched to the corresponding element 
    # of the array given in second argument to exec_params.
    #
    # (If we needed more parameters, we would call them $2, $3...
    # and would need the same number of values in the params array).
    sql = 'SELECT title, release_year, artist_id FROM albums WHERE id = $1;'

    params = [id]

    result = DatabaseConnection.exec_params(sql, params)

    single_album = []

    result.each do |instance|
      album = Album.new
      album.title = instance["title"]
      album.release_year = instance["release_year"]
      album.artist_id = instance["artist_id"]

      single_album << album
    end

    return single_album
    # (The code now needs to convert the result to a
    # Student object and return it)
  end
end

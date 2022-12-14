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
    sql = 'SELECT title, release_year, artist_id FROM albums WHERE id = $1;'
    params = [id]

    result = DatabaseConnection.exec_params(sql, params)
    record = result[0]

    album = Album.new
    album.id = record['id']
    album.title = record['title']
    album.release_year = record['release_year']
    album.artist_id = record['artist_id']
    
    return album
  end
end

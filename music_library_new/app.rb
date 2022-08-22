require_relative "lib/database_connection"
require_relative "lib/artist_repository"
require_relative "lib/album_repository"

DatabaseConnection.connect("music_library")

# artist_repository = ArtistRepository.new
# artist_repository.all.each { |artist| p artist }

album_repository = AlbumRepository.new
album_repository.all.each { |album| p album }

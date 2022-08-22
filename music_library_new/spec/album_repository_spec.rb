require "album_repository"

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read("spec/seeds_albums.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "music_library_test" })
    connection.exec(seed_sql)
  end

  describe AlbumRepository do
    before(:each) { reset_albums_table }

    it "returns a list of albums" do
      repo = AlbumRepository.new
      albums = repo.all
      expect(albums.length).to eq (2)
      expect(albums.first.id).to eq ("1")
      expect(albums.first.title).to eq ("OK Computer")
    end
  end
end

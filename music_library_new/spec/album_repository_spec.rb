require "album_repository"

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read("spec/seeds_albums.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "music_library_test" })
    connection.exec(seed_sql)
  end

  describe AlbumRepository do
    before(:each) { reset_albums_table }

    context "#all" do
      it "returns a list of albums" do
        repo = AlbumRepository.new
        albums = repo.all
        expect(albums.length).to eq (2)
        expect(albums.first.id).to eq ("1")
        expect(albums.first.title).to eq ("OK Computer")
      end
    end
    
    context "#find" do
      it "returns a single album" do
        repo = AlbumRepository.new
        album = repo.find(1)
        expect(album.title).to eq "OK Computer"
        expect(albums.release_year).to eq 1997
        expect(albums.artist_id).to eq 1
      end
    end
  end
end

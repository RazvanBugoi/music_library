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
        expect(album.release_year).to eq "1997"
        expect(album.artist_id).to eq "1"
      end

      it "returns a single album" do
        repo = AlbumRepository.new
        album = repo.find(2)

        expect(album.title).to eq "Toto IV"
        expect(album.release_year).to eq "1982"
        expect(album.artist_id).to eq "2"
      end
    end
  end
end

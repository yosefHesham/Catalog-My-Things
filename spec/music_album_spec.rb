require_relative '../music/music_album'

describe MusicAlbum do
  context 'when testing music album' do
    name = 'storm is over'
    publish_date = '2000-10-10'
    on_spotify = true
    music_album = MusicAlbum.new(name, publish_date, on_spotify)

    it 'return the instance of the class' do
      expect(music_album).to be_instance_of(MusicAlbum)
    end

    it 'should return the date instance of the class' do
      expect(music_album.publish_date).to eq(publish_date)
    end

    it 'should return the onspotify instance of the class' do
      expect(music_album.on_spotify).to equal true
    end
  end
end

require_relative './music/music_album'
require_relative './music/genre'
require 'date'
require 'json'

class Storage
  attr_reader :albums, :genres

  def initialize
    @albums = []
    @genres = []
    load_albums
    load_genres
  end

  def save_data(class_name, object)
    File.write("#{class_name}.json", JSON.dump(object))
  end

  def load_data(class_name)
    return [] unless File.exist?("#{class_name}.json")

    file_data = File.read("#{class_name}.json")
    JSON.parse(file_data, create_additions: true)
  end

  def load_albums
    if File.exist?('./music_albums.json')
      file = File.open('./music_albums.json')
  
      if File.empty?('./music_albums.json')
        puts 'Please add new album'
      else
        albums = JSON.parse(File.read('./music_albums.json'))
        albums.each do |a|
          album = MusicAlbum.new(a['name'], a['publish_date'], a['on_spotify'])
          @albums << album
        end
      end
  
      file.close
    else
      puts 'This file dont exits'
    end
  end
  
  def save_album(name, publish_date, on_spotify)
    obj = {
      name: name,
      publish_date: publish_date,
      on_spotify: on_spotify
    }
  
    if File.exist?('./music_albums.json')
      file = File.open('./music_albums.json')
      if file.size.zero?
        album = [obj]
      else
        album = JSON.parse(File.read('./music_albums.json'))
        album << obj
      end
      file.close
  
      myfile = File.open('./music_albums.json', 'w')
      myfile.write(JSON.pretty_generate(album))
      myfile.close
    else
      puts 'This file dont exist'
    end
  end
  
  def load_genres
    if File.exist?('./genres.json')
      file = File.open('./genres.json')
  
      if File.empty?('./genres.json')
        'Please add new music'
      else
        genres = JSON.parse(File.read('./genres.json'))
        genres.each do |g|
          genre = Genre.new(g['name'])
          @genres << genre
        end
      end
  
      file.close
    else
      puts 'This file dont exits'
    end
  end
  
  def save_genre(name)
    obj = { name: name }
  
    if File.exist?('./genres.json')
      file = File.open('./genres.json')
  
      if file.size.zero?
        genre = [obj]
      else
        genre = JSON.parse(File.read('./genres.json'))
        genre << obj
      end
  
      file.close
  
      myfile = File.open('./genres.json', 'w')
      myfile.write(JSON.pretty_generate(genre))
      myfile.close
    else
      puts 'This file dont exist'
    end
  end
  
  def add_album
    print 'Music name: '
    name = gets.chomp
    print 'Genre: '
    g_name = gets.chomp
    print 'Published date: [YYYY-MM-DD] '
    publish_date = gets.chomp
    print 'Music is on Spotify? [Y/N] '
    spotify = gets.chomp.upcase
    case spotify
    when 'Y'
      spotify = true
    when 'N'
      spotify = false
    else
      puts 'Invalid option \n'
    end
  
    album = MusicAlbum.new(name, publish_date, on_spotify: spotify)
    @albums.push(album)
    save_album(name, publish_date, spotify)
  
    genre = Genre.new(g_name)
    @genres.push(genre)
    save_genre(g_name)
    puts 'Music Added successfully'
  end
  
  def list_albums
    puts ''
    puts 'List of all music albums:'
    puts ''
    if @albums.empty?
      puts 'No music recorded yet.'
      return
    end
    @albums.each do |album|
      puts "Song name: #{album.name},\nPublished date: #{album.publish_date},\nOn Spotify: #{album.on_spotify}\n\n"
    end
  end
  
  def list_genres
    puts ''
    puts 'List of all genres:'
    puts ''
    if @genres.empty?
      puts 'No genres recorded yet.'
      return
    end
    @genres.each do |genre|
      puts "Genre: #{genre.name}"
    end
    puts ''
  end
end



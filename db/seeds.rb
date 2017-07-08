Song.destroy_all
Artist.destroy_all

artist1 = Artist.create(name: "Luciano Pavarotti", bio: "I don't like taxes", genre: "opera", remote_image_url: "http://res.cloudinary.com/lorenzocloudinary/image/upload/v1499512852/codaisseurify/Pavarotti_srj4ai.jpg")
artist2 = Artist.create(name: "Andrea Bocelli", bio: "I wouldn't see why not?", genre: "pop", remote_image_url: "http://res.cloudinary.com/lorenzocloudinary/image/upload/v1499512852/codaisseurify/Bocelli_cekl5o.jpg")
artist3 = Artist.create(name: "Maria Callas", bio: "What am I doing here?", genre: "opera", remote_image_url: "http://res.cloudinary.com/lorenzocloudinary/image/upload/v1499512852/codaisseurify/Callas_a27cew.jpg")

song1 = Song.create(name: "La Traviata", year: 1992, artist: artist1)
song2 = Song.create(name: "Rigoletto", year: 1984, artist: artist1)
song3 = Song.create(name: "Madame Butterfly", year: 1979, artist: artist1)
song4 = Song.create(name: "Tosca", year: 1966, artist: artist1)
song5 = Song.create(name: "Time to say goodbye", year: 1999, artist: artist2)

puts "#{Artist.all.count} artists and #{Song.all.count} songs were created."

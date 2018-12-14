require 'faker'

puts "Cleaning database..."
Message.destroy_all
Skill.destroy_all
Jamm.destroy_all
Participation.destroy_all
Instrument.destroy_all
User.destroy_all
puts "Done"

puts "Creating seeds..."

addresses = ["100 rue des Far Tanger, Morocco", "Route de l'Oasis, Rabat, Morocco", "64B Boulevard de l'Atlantide, Casablanca, Morocco", "76, Rue Ibnou Rachid Elfihri, Roches Noires، Dar-el-Beida Assila, Morocco", "Rue Brahim Nakhai، Maârif Casablanca, Morocco", "32 Rue Al Bakri Casablanca 20250, <Morocco></Morocco>
", "33 Rue Najib Mahfoud, Casablanca 20000, Morocco", "1 Rue Ait Ba Amrane , Les champs Mohamed V 20250 Casablanca, Morocco ", " 31 boulevard Hassan Seghir, 20000 Dakhla, Morocco"]
titles = ["Trial Jam in my new apartment!", "Wonderful Jam", "Jam with guitarists", "Jam in nice studio in Casablanca", "Nice Jam Sesh", "Moved to Casablanca!", "Blues Jam", "Heavy Metal Jam", "Cool Jazz get together", "Jam session with awesome view", "Nice sound quality in this place", "Sonic perfection", "Musical get-together","Casablanca it's so cool , lets Jam", "Amazing jamm session in good quality studio", "Nice place with nice food and beers, lets jam"]
descriptions = ["Wanted to get a few friends together to jam after work", "Ive got a passion for Jazz and Blues and really wanted to get a few people together to go on a 2 hours bender", "I was tired of trying to organise something in a studio nearby, found this app and decided to start a jam in my living room, anyone welcome", "Into metal and dont have all the equipment but have a drum set so people are welcome to come along with their own instruments", "Finally have a few hours to spare, just lost my job and have a free house most of the time so really have been meaning to get a few flamenco guitarists together", "Ive got a really nice piano at home, please bring some guitars and we can have a nice sesh", "Its abit late but hope you guys can make it at 9, I have a cool living room with alot of space", "My drum set is awesome, please bring some other instruments", "Hellooooooo Guyyyyysssss!!!!!! Please bring whatever instrument you want and come join me at my friends for an awesome jam"]
levels = ["Beginner", "Intermediate", "Expert"]

instrument_categories = ["String", "Guitar", "Woodwind", "Brass", "Percussion", "Keybords"]

instruments = {
  "String" => ["Violin", "Viola", "Cello" "Double bass"],
  "Guitar" => ["Bass", "Classic", "Folk", "Flamenca", "Electric"],
  "Woodwind" => ["Piccolo", "Flute", "Oboe", "English Horn", "Clarinet"],
  "Brass" => ["Trumpet", "Trombone", "Tuba", "French Horn"],
  "Percussion" => ["Drum", "Cymbals", "Guiro", "Timpani", "Triangle"],
  "Keybords" => ["Piano", "Harpsichord", "Organ"]
}

instrument_pictures = {
  "Violin" => "db/seed_img/violin.jpg",
  "Viola" => "db/seed_img/viola.jpg",
  "Cello" => "db/seed_img/Cello.jpg",
  "Double bass" => "db/seed_img/Double_bass.jpg",
  "Bass" => "db/seed_img/bass.jpg",
  "Classic" => "db/seed_img/classic.jpg",
  "Folk" => "db/seed_img/folk.jpg",
  "Flamenca" => "db/seed_img/flamenca.jpg",
  "Electric" => "db/seed_img/electric.jpg",
  "Piccolo" => "db/seed_img/Piccolo.jpg",
  "Flute" => "db/seed_img/Flute.jpg",
  "Oboe" => "db/seed_img/Oboe.jpg",
  "English Horn" => "db/seed_img/english_horn.jpeg",
  "Clarinet" => "db/seed_img/Clarinet.jpg",
  "Trumpet" => "db/seed_img/Trumpet.jpg",
  "Trombone" => "db/seed_img/Trombone.jpg",
  "Tuba" => "db/seed_img/Tuba.jpg",
  "French Horn" => "db/seed_img/French_Horn.jpg",
  "Drum" => "db/seed_img/Drum.jpg",
  "Cymbals" => "db/seed_img/Cymbals.jpg",
  "Guiro" => "db/seed_img/Guiro.jpg",
  "Timpani" => "db/seed_img/Timpani.jpg",
  "Triangle" => "db/seed_img/Triangle.jpg",
  "Piano" => "db/seed_img/Piano.jpg",
  "Harpsichord" => "db/seed_img/Harpsichord.jpg",
  "Organ" => "db/seed_img/Organ.jpg",

}

instruments.each_key do |category|
  instruments[category].each do |instrument|
    inst = Instrument.new(
      name: instrument,
      category: category
    )
    inst.remote_icon_url_url = instrument_pictures[instrument]
    inst.save
  end
end

avatars = {
  "Mehdi" => "https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544737238/Mehdi.jpg",
  "Ibrahim" => "https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544737244/Ibrahim.jpg",
  "Abdelhadi" => "https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544737245/Abdelhadi.jpg",
  "Margaux" => "https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544737246/Margaux.jpg",
  "Zakaria" => "https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544737244/Zakaria.jpg",
  "Anna" => "https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544737242/Malise.jpg",
  "Rabab" => "https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544737242/Rabab.jpg",
  "Salah" => "https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544737245/Salah.jpg",
}

avatars.each_key do |name|
  User.create(
    username: name.downcase,
    first_name: name,
    last_name: Faker::Name.last_name,
    email: "#{name.downcase}@gmail.com",
    remote_avatar_url: avatars[name],
    password: '123456'
  )
  puts "User #{name.downcase} created"
end

puts "Done"

jam_pictures = ["https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544785721/5.jpg","https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544785720/3.jpg","https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544785720/8.jpg","https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544785720/2.jpg","https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544785720/1.jpg","https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544785720/4.jpg","https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544785721/7.jpg","https://res.cloudinary.com/dmfhkzsd9/image/upload/v1544785720/6.jpg"]

8.times do |n|
 capacity = rand(2..8)

 Jamm.create(
   title: titles.sample,
   description: descriptions.sample,
   location: addresses.sample,
   date: Faker::Date.forward(30),
   duration: rand(1..3),
   capacity: capacity,
   remote_photo_url: jam_pictures[n],
   creator: User.all.sample
 )

 puts "Jamm ##{n} done!"
end



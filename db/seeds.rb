
require 'faker'

Message.destroy_all
Skill.destroy_all
Jamm.destroy_all
Participation.destroy_all
Instrument.destroy_all
User.destroy_all





# addresses = ["8813 lasalle, Montreal", "7519 mountmatten, Cote st luc, Montreal", "Rue Brahim Nakhai، Maârif, Casablanca", "303 university, Montreal", "10 hampsted, Montreal"]
# titles = ["Trial Jamm in my new apartment!", "Wonderful Jamm", "Jamm with friends", "Jamm in nice studio in Lisbon", "Nice Jamm Sesh", "Moved to Lisbon!", "Blues Jamm", "Heavy Metal Jamm", "Jamm in Lisbon", "Jamm in London", "Cool Jazz get together", "Jamm sesh with awesome view", "Amazing studio", "Nice sound quality in this place", "Sonic perfection", "Little small but good sound", "Musical get-together", "WTF Lisbon is so cool lets jamm", "Amazing jamm session in good quality studio", "Nice place with nice food, lets jamm", "Cool alternative apartment to jamm in"]
# descriptions = ["Wanted to get a few friends together to jamm after work", "Ive got a passion for Jazz and Blues and really wanted to get a few people together to go on a 7 hour bender", "I was tired of trying to organise something in a studio nearby, found this app and decided to start a jamm in my living room, anyone welcome", "Into metal and dont have all the equipment but have a drum set so people are welcome to come along with their own instruments", "I have a small little apartment and really have been meaning to bring people over for a while to jamm", "Finally have a few hours to spare, just lost my job and have a free house most of the time so really have been meaning to get a few people together", "Ive got a really nice piano at home, please bring some guitars and we can have a nice sesh", "Its abit late but hope you guys can make it at 9, I have a cool living room with alot of space", "I have tried and tried to organise jamms in studios but its impossible to organise", "My drum set is awesome, please bring some other instruments", "Hellooooooo Guyyyyysssss!!!!!! Please bring whatever instrument you want and come join me a my friends for an awesome jamm"]
# levels = ["Beginner", "Intermediate", "Expert"]

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

insts = []
instruments.each_key do |category|
  instruments[category].each do |instrument|
    inst = Instrument.new(
      name: instrument,
      category: category
    )
    inst.remote_icon_url_url = instrument_pictures[instrument]
    inst.save
    insts << inst
  end
end


# USER
#50.times do |n|
#  user = User.create!(
#   username: Faker::Name.middle_name,
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   avatar: Faker::Avatar.image,
#   email: Faker::Internet.email,
#   password: '123456'
# )

# instrument = nil
#  rand(1..3).times do
#    insts.delete(instrument)
#    instrument = insts.sample[0]
#    Skill.create(
#      user: user,
#      instrument: instrument,
#      level: levels.sample[0]
#   )
#  end

#  puts "User ##{n} done!"
#  puts "\n"
#end


# JAMMS


#  jam = []

#20.times do |n|
#  capacity = rand(2..10)

#  jamm = Jamm.create!(
#    title: titles.sample,
#    description: descriptions.sample,
#    location: addresses.sample,
#    date: Faker::Date.forward(30),
#    duration: rand(1..3),
#    capacity: capacity,
#    creator: User.all.sample
#  )
#     jam << jamm

#  statu =  ["accepted", "pending", "declined"]

#  user = nil

#  capacity.times do

 #   jam.delete(user)
 #   user = jam.sample[0]
  #  Participation.create(
   #   jamm: jamm,
    #  user: user,
     # status: statu.sample[0]
    #)
  #end

  #puts "Jamm ##{n} done!"
  #puts "\n"
#end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Participation.destroy_all
Instrument.destroy_all
Jamm.destroy_all
User.destroy_all
Skill.destroy_all


addresses = ["8813 lasalle, Montreal", "7519 mountmatten, Cote st luc", "12 maisonneuve, Montreal", "303 university, Montreal", "10 hampsted, Montreal"]
titles = ["Trial Jamm in my new apartment!", "Wonderful Jamm", "Jamm with friends", "Jamm in nice studio in Lisbon", "Nice Jamm Sesh", "Moved to Lisbon!", "Blues Jamm", "Heavy Metal Jamm", "Jamm in Lisbon", "Jamm in London", "Cool Jazz get together", "Jamm sesh with awesome view", "Amazing studio", "Nice sound quality in this place", "Sonic perfection", "Little small but good sound", "Musical get-together", "WTF Lisbon is so cool lets jamm", "Amazing jamm session in good quality studio", "Nice place with nice food, lets jamm", "Cool alternative apartment to jamm in"]
descriptions = ["Wanted to get a few friends together to jamm after work", "Ive got a passion for Jazz and Blues and really wanted to get a few people together to go on a 7 hour bender", "I was tired of trying to organise something in a studio nearby, found this app and decided to start a jamm in my living room, anyone welcome", "Into metal and dont have all the equipment but have a drum set so people are welcome to come along with their own instruments", "I have a small little apartment and really have been meaning to bring people over for a while to jamm", "Finally have a few hours to spare, just lost my job and have a free house most of the time so really have been meaning to get a few people together", "Ive got a really nice piano at home, please bring some guitars and we can have a nice sesh", "Its abit late but hope you guys can make it at 9, I have a cool living room with alot of space", "I have tried and tried to organise jamms in studios but its impossible to organise", "My drum set is awesome, please bring some other instruments", "Hellooooooo Guyyyyysssss!!!!!! Please bring whatever instrument you want and come join me a my friends for an awesome jamm"]
levels = ["Beginner", "Intermediate", "Expert"]

instrument_categories = ["String", "Guitar", "Woodwind", "Brass", "Percussion", "Keybords", "other"]

instruments = {
  string: ["Violin", "Viola", "Cello" "Double bass"],
  guitar: ["Bass", "Classic", "Folk", "Flamenca", "Electric"],
  Woodwind: ["Piccolo", "Flute", "Oboe", "English Horn", "Clarinet"],
  Brass: ["Trumpet", "Trombone", "Tuba", "French Horn"],
  Percussion: ["Drum", "Cymbals", "Guiro", "Timpani", "Triangle"],
  Keybord: ["Piano", "Harpsichord", "Organ"]
}

insts = []
instruments.each_key do |category|
  instruments[category].each do |instrument|
    inst = Instrument.create(
      name: instrument,
      category: category
    )
    insts << inst
  end
end


# USER
50.times do |n|
  user = User.create!(
    email: Faker::Internet.email,
    password: '123456'
  )

  instrument = nil
  rand(1..3).times do
    insts.delete(instrument)
    instrument = insts.sample[0]
    Skill.create(
      user: user,
      instrument: instrument,
      level: levels.sample[0]
    )
  end

  puts "User ##{n} done!"
  puts "\n"
end

# i = 1

# # Instrument
# instrument_category = ["Bass Guitar", "Drum Set", "Classic guitar", "Flute", "Harp", "Maracas", "Piano", "Saxophone",
#                       "Triangle", "Trumpet","Violen", "Electric guitar"]

# i = 1

# instrument_category.each do |instrument|
#  Instrument.create!( category: instrument,

# 100.times do
#   Instrument.create!(
#     model: Faker::G.location,
#     user_id: User.ids.sample,
#     instrument_type_id: InstrumentType.all.sample.id
#     )
#   puts "Instrument ##{counter} done!"
#   puts "\n"
#   i += 1
# end

# JAMMS


  jam = []

20.times do |n|
  capacity = rand(2..10)

  jamm = Jamm.create!(
    title: titles.sample,
    description: descriptions.sample,
    location: addresses.sample,
    date: Faker::Date.forward(30),
    duration: rand(1..3),
    capacity: capacity,
    creator: User.all.sample
  )
     jam << jamm

  statu =  ["accepted", "pending", "declined"]

  user = nil

  capacity.times do

    jam.delete(user)
    user = jam.sample[0]
    Participation.create(
      jamm: jamm,
      user: user,
      status: statu.sample[0]
    )
  end

  puts "Jamm ##{n} done!"
  puts "\n"
end

# Participation

# i = 1

# Jamm.all.each do |jam|
#   num = rand(1..jam.capacity)
#   num.times do
#     user_id = User.all.sample.id
#     if Instrument.where(user_id: user_id).empty?
#      instrument_participant_id = Instrument.all.sample.id
#     else
#       instrument_participant_id = Instrument.where(user_id: user_id).sample.id
#     end
#     new_participation = Participation.create!(jamm_id: jam.id, user_id: user_id, instrument_id: instrument_participant_id, creator: user.first_id, status:["Pending", "Active", "Inactive"].sample)
#   end
#   puts "Jamm participant ##{counter} has joint the group!"
#   puts "\n"
#   i += 1
# end


# User.create!(email: 'user@user.com', password: '123456', username: 'Knopfler', picture: "p#{1}", l)
# Instrument.create!(categoty:

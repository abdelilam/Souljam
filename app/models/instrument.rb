class Instrument < ApplicationRecord
  CATEGORIES = ["String", "Guitar", "Woodwind", "Brass", "Percussion", "Keybords"]
   has_many :users, through: :skills
   has_many :participations
   has_many :skills


  validates :name, presence: :true
  validates :category, inclusion: {
    in: CATEGORIES }

end

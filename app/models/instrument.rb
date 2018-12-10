class Instrument < ApplicationRecord

    mount_uploader :avatar, PhotoUploader

  CATEGORIES = ["String", "Guitar", "Woodwind", "Brass", "Percussion", "Keybords"]
   has_many :users, through: :skills
   has_many :participations
   has_many :skills, dependent: :destroy


  validates :name, presence: :true
  validates :category, inclusion: {
    in: CATEGORIES }

end

class Instrument < ApplicationRecord
   belongs_to :user
   has_many :participations



  validates :name, presence: :true
  validates :category, inclusion: {
    in: %w("Bass Guitar", "Drum Set", "Classic guitar", "Flute", "Harp", "Maracas", "Piano", "Saxophone",
          "Triangle", "Trumpet","Violen", "Electric guitar") }

end

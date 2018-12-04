class Instrument < ApplicationRecord
   belongs_to :user
   has_many :participations

  validates :name, presence: :true
  validates :category, presence: :true

end

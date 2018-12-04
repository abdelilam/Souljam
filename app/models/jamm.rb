class Jamm < ApplicationRecord

    has_many :participations
    has_many :users, through: :participations
    has_many :instruments, through: :participations

    validates :title, presence: :true
    validates :description, presence: :true
    validates :location, presence: :true
    validates :date, presence: :true
    validates :duration, presence: :true, numericality: { only_integer: true }, inclusion: { in: (1..23) }
    validates :capacity, presence: :true, numericality: { only_integer: true }

end

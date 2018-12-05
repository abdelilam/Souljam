class Jamm < ApplicationRecord
  has_many :participations
  has_many :users, through: :participations
  has_many :instruments, through: :participations
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :capacity, presence: true, numericality: { only_integer: true }
end

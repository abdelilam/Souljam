class Jamm < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  mount_uploader :photo, PhotoUploader

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :instruments, through: :participations
  has_many :messages
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 1 }
end

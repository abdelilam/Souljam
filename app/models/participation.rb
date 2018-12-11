class Participation < ApplicationRecord
  belongs_to :jamm
  belongs_to :user
  belongs_to :instrument
  has_many :reviews

  validates :status, presence: :true, inclusion: { in: ["Pending", "Accepted", "Refused"] }
  attribute :status, :string, default: "Pending"
end

class Participation < ApplicationRecord
  belongs_to :jamm
  belongs_to :user
  belongs_to :instrument

  validates :creator, uniqueness: :true
  validates :status, presence: :true, inclusion: { in: ["Pending", "Accepted", "Refused"] }
end

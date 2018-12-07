class Participation < ApplicationRecord
  belongs_to :jamm
  belongs_to :user
  belongs_to :instrument

  validates :status, presence: :true, inclusion: { in: ["Pending", "Accepted", "Refused"] }
  attribute :status, :string, default: "Pending"
end

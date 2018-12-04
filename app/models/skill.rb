class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  validates :level, presence: :true, inclusion: { in: ["Beginner", "Intermediate", "Expert"] }
end

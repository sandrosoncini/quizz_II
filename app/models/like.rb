class Like < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :idea, uniqueness: {scope: :user}
end

class Idea < ApplicationRecord
    belongs_to :user

    has_many :reviews, dependent: :destroy

    has_many :likes, dependent: :destroy 
    has_many :users, through: :likes

    validates :title, presence: true, uniqueness: {case_sensitive: false}
    validates :description, presence: { message: "must exist" }
end

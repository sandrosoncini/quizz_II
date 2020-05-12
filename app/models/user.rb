class User < ApplicationRecord
    has_secure_password

    has_many :ideas
    has_many :reviews

    has_many :likes
    has_many :liked_ideas, through: :likes, source: :idea
end

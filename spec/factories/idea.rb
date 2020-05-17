# https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md
# Defining factories docs https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#defining-factories

FactoryBot.define do
  factory :idea, class: 'Idea' do
    title  {Faker::Book.title}
    description {Faker::ChuckNorris.fact}
    association(:user, factory: :user)
  end
end
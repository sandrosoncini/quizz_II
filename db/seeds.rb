# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Idea.destroy_all()
User.destroy_all()

NUM_OF_IDEAS = 100
NUM_OF_USERS = 10

users = User.all

PASSWORD = 'supersecret'
super_user = User.create(
    first_name: 'jon',
    last_name: 'snow',
    email: 'js@winterfell.gov',
    password: PASSWORD,
    

)
NUM_OF_USERS.times do 
    created_at = Faker::Date.backward(days: 365 * 5)
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: PASSWORD,
    )
end

NUM_OF_IDEAS.times do
    created_at = Faker::Date.backward(days: 365)
    idea = Idea.create({
      title: Faker::Book.title,
      description: Faker::ChuckNorris.fact,
      user: users.sample,
      created_at: created_at,
      updated_at: created_at
    })
end


puts Cowsay.say("Created #{Idea.count} ideas each!", :sheep)
puts Cowsay.say("Created #{User.count} ideas each!", :cow)
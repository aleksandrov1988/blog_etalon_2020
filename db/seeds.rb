# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pwd = 'Efae6dew'
user = User.create!(name: 'Администратор', login: 'admin', password: pwd, password_confirmation: pwd, admin: true)
100.times do
  user.posts.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
end

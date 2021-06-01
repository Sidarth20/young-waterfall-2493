# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
movie_1 = studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
movie_2 = studio.movies.create!(title: 'Jumanji', creation_year: 1995, genre: 'Action/Adventure')
movie_3 = studio.movies.create!(title: 'Pocahontas', creation_year: 1995, genre: 'Action/Adventure')

actor_1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: true)
actor_2 = Actor.create!(name: 'Robin Williams', age: 63, currently_working: false)
actor_3 = Actor.create!(name: 'Irene Bedard', age: 53, currently_working: true)
actor_4 = Actor.create!(name: 'Karen Allen', age: 69, currently_working: true)
actor_5 = Actor.create!(name: 'John Rhys-Davies', age: 77, currently_working: true)
actor_6 = Actor.create!(name: 'Paul Freeman', age: 78, currently_working: true)

movie_1.actors << actor_1
movie_2.actors << actor_2
movie_3.actors << actor_3
movie_1.actors << actor_4

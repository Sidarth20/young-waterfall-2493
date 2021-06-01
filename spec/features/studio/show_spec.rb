require 'rails_helper'

RSpec.describe Studio do
  describe 'show page' do
    it 'can see the studios name, location, & titles of its movies' do
      # Story 1
      # Studio Show
      # As a user,
      # When I visit a studio show page
      # I see the studio's name and location
      # And I see the titles of all of its movies
      studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      movie_1 = studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      movie_2 = studio.movies.create!(title: 'Jumanji', creation_year: 1999, genre: 'Action/Adventure')
      movie_3 = studio.movies.create!(title: 'Pocahontas', creation_year: 2005, genre: 'Action/Adventure')

      visit "/studios/#{studio.id}"
      save_and_open_page
      expect(page).to have_content(studio.name)
      expect(page).to have_content(studio.location)
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
      expect(page).to have_content(movie_3.title)
    end

    it 'can see the studios name, location, & titles of its movies' do
      # Story 2
      # Studio's Actors
      # As a user,
      # When I visit a studio show page
      # I see a list of actors that have acted in any of the studio's movies
      # And I see that the list of actors is unique (no duplicate actors)
      # And I see that the list of actors is ordered from oldest actor to youngest
      # And I see that the list of actors only includes actors that are currently working
      studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      movie_1 = studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      movie_2 = studio.movies.create!(title: 'Jumanji', creation_year: 1995, genre: 'Action/Adventure')
      movie_3 = studio.movies.create!(title: 'Pocahontas', creation_year: 1995, genre: 'Action/Adventure')

      actor_1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: true)
      # actor_4 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: true)
      actor_2 = Actor.create!(name: 'Robin Williams', age: 63, currently_working: false)
      actor_3 = Actor.create!(name: 'Irene Bedard', age: 53, currently_working: true)

      movie_1.actors << actor_1
      # movie_1.actors << actor_4
      movie_2.actors << actor_2
      movie_3.actors << actor_3

      visit "/studios/#{studio.id}"
      save_and_open_page
      expect(page).to have_content(actor_1.name)
      expect(page).to_not have_content(actor_2.name)
      expect(page).to have_content(actor_3.name)
      expect(actor_1.name).to appear_before(actor_3.name)
    end
  end
end

require 'rails_helper'

RSpec.describe Movie do
  describe 'show page' do
    it 'can see the movies title, creation year, & genre as well as all the actors in the movie' do
      # Story 3
      # Movie Show
      # As a user,
      # When I visit a movie's show page.
      # I see the movie's title, creation year, and genre,
      # and I see all of the actors in the movie
      studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      movie_1 = studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')

      actor_1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: true)
      actor_4 = Actor.create!(name: 'Karen Allen', age: 69, currently_working: true)

      movie_1.actors << actor_1
      movie_1.actors << actor_4

      visit "/movies/#{movie_1.id}"
      save_and_open_page
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.creation_year)
      expect(page).to have_content(movie_1.genre)
      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_4.name)
    end
  end
end

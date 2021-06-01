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
  end
end

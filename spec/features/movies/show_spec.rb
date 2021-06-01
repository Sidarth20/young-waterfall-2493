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

      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.creation_year)
      expect(page).to have_content(movie_1.genre)
      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_4.name)
    end

    it 'can see form to add actor to movie' do
      # Story 4
      # Add an Actor to a Movie
      # As a user,
      # When I visit a movie show page,
      # I do not see any actors listed that are not part of the movie
      # And I see a form to add an actor to this movie
      # When I fill in the form with the name of an actor that exists in the database
      # And I click submit
      # Then I am redirected back to that movie's show page
      # And I see the actor's name is now listed
      # (You do not have to test for any sad path, for example if the name submitted does not match an existing actor)
      studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      movie_1 = studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      actor_1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: true)
      actor_4 = Actor.create!(name: 'Karen Allen', age: 69, currently_working: true)
      actor_3 = Actor.create!(name: 'Irene Bedard', age: 53, currently_working: true)

      movie_1.actors << actor_1
      movie_1.actors << actor_4

      # actor_5 = Actor.create!(name: 'John Rhys-Davies', age: 77, currently_working: true)
      visit "/movies/#{movie_1.id}"

      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_4.name)
      expect(page).to_not have_content(actor_3.name)

      # click_link('Add an Actor')
      # visit "/actors/new"

      fill_in('name', with: 'John Rhys-Davies')
      click_button('Submit')
      # new_actor_id = Actor.last.id

      expect(current_path).to eq("/movies/#{movie_1.id}")
      expect(page).to have_content(actor_5.name)
    end
  end
end

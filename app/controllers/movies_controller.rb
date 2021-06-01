class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actor = @movie.actors
  end

  def create
    @actor = Actor.create!(
      name: params[:name]
    )
    redirect_to "/movies/#{@movie}"
  end
end

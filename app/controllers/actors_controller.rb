class ActorsController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @actor = Actor.create!(
      name: params[:name]
    )
    redirect_to "/movies/#{@movie.id}"
  end
end

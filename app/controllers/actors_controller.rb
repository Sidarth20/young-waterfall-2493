class ActorsController < ApplicationController
  def create
    @actor = Actor.create!(
      name: params[:name]
    )
    # return RedirectToAction("Show", "MoviesController")
    # @Html.ActionLink("/movies/:id", "Show", "MoviesController", null, null)
    @actor.save!
    redirect_to action: "show", controller: 'movies'
  end
end

class ActorsController < ApplicationController
  def create
    @actor = Actor.create!(
      name: params[:name]
    )
    # return RedirectToAction("Show", "MoviesController")
    # @Html.ActionLink("/movies/:id", "Show", "MoviesController", null, null)
    @actor.save!
    redirect_to :controller => 'MoviesController', :action => "get"
  end
end

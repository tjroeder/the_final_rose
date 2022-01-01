class ContestantsController < ApplicationController
  def index
    @bachelorette = Bachelorette.find(set_bachelorette[:bachelorette_id])
    @contestants = @bachelorette.contestants
  end

  def show
    @contestant = Contestant.find(set_contestant[:id])
  end

  private

  def set_bachelorette
    params.permit(:bachelorette_id)
  end

  def set_contestant
    params.permit(:id)
  end
end
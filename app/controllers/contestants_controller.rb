class ContestantsController < ApplicationController
  def index
    @bachelorette = Bachelorette.find(set_bachelorette[:bachelorette_id])
    @contestants = @bachelorette.contestants
  end

  private

  def set_bachelorette
    params.permit(:bachelorette_id)
  end
end
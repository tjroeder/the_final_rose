class OutingsController < ApplicationController
  def show
    @outing = Outing.find(set_outing[:id])
  end

  private

  def set_outing
    params.permit(:id)
  end
end
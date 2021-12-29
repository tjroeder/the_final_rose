class BachelorettesController < ApplicationController
  def show
    @brette = Bachelorette.find(params[:id])
  end
end
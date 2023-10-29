class BeerTypesController < ApplicationController
  def new
    BeerType.create(name:params[:beer_types][:name],flow_volume:params[:beer_types][:flow_volume],prize_per_litre:params[:beer_types][:prize_per_litre])
    @user = User.find(params[:beer_types][:user_id])
    render 'users/tap_beer_show'
  end
end

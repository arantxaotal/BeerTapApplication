class BeerTypesController < ApplicationController
  def new
    @user = User.find(params[:beer_types][:user_id])
    render 'users/tap_beer_show'
  end
end

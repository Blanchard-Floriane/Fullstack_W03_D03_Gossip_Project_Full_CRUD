class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @users = @city.users
    @gossips = Gossip.joins(:user).where(users: {city_id: @city.id})
  end
end

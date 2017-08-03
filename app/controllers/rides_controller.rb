class RidesController < ApplicationController
  def create
    ride = Ride.create(
    user_id: current_user.id,
    attraction_id: params[:attraction_id]
    )
    redirect_to user_path(current_user), notice: ride.take_ride
  end
end

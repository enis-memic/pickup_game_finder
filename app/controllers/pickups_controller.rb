class PickupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @pickup = Pickup.new
  end

  def create
    @pickup = current_user.pickups.build(pickup_params)
    if @pickup.save
      redirect_to root_path, notice: 'Pick-up game created successfully!'
    else
      render :new
    end
  end

  def index
    @pickups = Pickup.all
  end

  private

  def pickup_params
    params.require(:pickup).permit(:name, :location)
  end
end

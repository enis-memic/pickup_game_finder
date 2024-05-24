class PickupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pickup, only: [:show]

  def new
    @pickup = Pickup.new
  end

  def create
    @pickup = current_user.pickups.build(pickup_params)
    if @pickup.save
      redirect_to @pickup, notice: 'Pickup was successfully created.'
    else
      render :new
    end
  end

  def index
    @pickups = Pickup.all
  end

  def show
    # @pickup is already set by the before_action
  end

  private

  def set_pickup
    @pickup = Pickup.find(params[:id])
  end

  def pickup_params
    params.require(:pickup).permit(:name, :location)
  end
end

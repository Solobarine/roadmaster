class VehiclesController < ApplicationController
  # before_action :validate_images, only: [:create]
  before_action :set_vehicle, only: %i[show update destroy]

  # GET /vehicles
  def index
    @vehicles = Vehicle.all

    render json: @vehicles
  end

  # GET /vehicles/1
  def show
    render json: @vehicle
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)

    authorize @vehicle, :create?

    if @vehicle.save
      render json: { message: 'Vehicle created successfully', vehicle: @vehicle }, status: :created, location: @vehicle
    else
      render json: { error: @vehicle.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    authorize @vehicle, :update?

    if @vehicle.update(vehicle_params)
      render json: { message: 'Vehicle updated successfully', vehicle: @vehicle }
    else
      render json: { error: @vehicle.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/1
  def destroy
    authorize @vehicle, :destroy?

    @vehicle.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def validate_images
    unless params[:vehicle][:images].present?
      render json: { error: 'Images must be attached' }, status: :unprocessable_entity
      return
    end

    return unless params[:vehicle][:images].length > 4

    render json: { error: 'Maximum of 4 images allowed' }, status: :unprocessable_entity
    nil
  end

  # Only allow a list of trusted parameters through.
  def vehicle_params
    params.require(:vehicle).permit(:brand_id, :name, :year, :body_type, :engine_type, :fuel_type, :transmission,
                                    :drivetrain, :horsepower, :torque, :seating_capacity, :cargo_capacity,
                                    :fuel_economy_city, :fuel_economy_highway, :safety_rating, :msrp, :vin, :trim_level,
                                    :exterior_color, :interior_color, :mileage, :condition, :registration_state,
                                    :registration_expiry, :warranty_status, :price, :status, :location, features: {},
                                                                                                        images: [])
  end
end

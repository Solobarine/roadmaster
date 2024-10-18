class ModelsController < ApplicationController
  before_action :set_model, only: %i[show update destroy]

  # GET /models
  def index
    @models = Model.all

    render json: @models
  end

  # GET /models/1
  def show
    render json: @model
  end

  # POST /models
  def create
    unless params[:model][:images].present?
      render json: { error: 'Images must be attached' }, status: :unprocessable_entity
      return
    end

    @model = Model.new(model_params)

    authorize @model, :create?

    if @model.save
      render json: { message: 'Model created successfully', model: @model }, status: :created, location: @model
    else
      render json: { error: @model.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /models/1
  def update
    authorize @model, :update?
    if @model.update(model_params)
      render json: { message: 'Model updated successfully', model: @model }
    else
      render json: { error: @model.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /models/1
  def destroy
    authorize @model, :destroy?
    @model.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_model
    @model = Model.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def model_params
    params.require(:model).permit(:brand_id, :name, :year, :body_type, :engine_type, :fuel_type, :transmission,
                                  :drivetrain, :horsepower, :torque, :seating_capacity, :cargo_capacity,
                                  :fuel_economy_city, :fuel_economy_highway, :safety_rating, :msrp, images: [])
  end
end

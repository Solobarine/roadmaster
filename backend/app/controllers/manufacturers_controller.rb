class ManufacturersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @manufacturers = Manufacturer.all

    render json: @manufacturers.map { |manufacturer|
                   manufacturer.as_json.merge({ logo: url_for(manufacturer.logo) })
                 }
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])

    if @manufacturer
      render json: @manufacturer.as_json.merge({ logo: url_for(@manufacturer.logo) })
    else
      render json: { error: 'Manufacturer Not Found' }, status: :not_found
    end
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    authorize @manufacturer, :create?

    if @manufacturer.save
      render json: { message: 'Manufacturer created Successfully',
                     manufacturer: manufacturer_with_logo(@manufacturer) },
             status: :created
    else
      render json: { error: @manufacturer.errors }, status: :unprocessable_entity
    end
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])

    authorize @manufacturer, :update?

    if @manufacturer.update(manufacturer_params)
      render json: { message: 'Manufacturer Updated', manufacturer: manufacturer_with_logo(@manufacturer) }
    else
      render json: { error: @manufacturer.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])

    authorize @manufacturer, :destroy?

    if @manufacturer.destroy
      render json: { message: 'Manufacturer Removed Successfully' }
    else
      render json: { error: 'An Error Occurred' }, status: :unprocessable_entity
    end
  end

  private

  def manufacturer_with_logo(manufacturer)
    manufacturer.as_json.merge({ logo: url_for(manufacturer.logo) })
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country, :founded_year, :logo)
  end

  def record_not_found
    render json: { error: 'Manufacturer Not Found' }, status: :not_found
  end
end

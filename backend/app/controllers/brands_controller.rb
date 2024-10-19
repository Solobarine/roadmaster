class BrandsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @brands = Brand.all

    render json: @brands.map { |brand|
      brand_with_logo(brand)
    }, status: :ok
  end

  def show
    @brand = Brand.find(params[:id])

    if @brand
      render json: brand_with_logo_and_manufacturer(@brand)
    else
      render json: { error: 'Brand Not Found' }, status: :not_found
    end
  end

  def create
    @brand = Brand.new(brand_params)

    authorize @brand, :create?

    if @brand.save
      render json: { message: 'Brand created successfully', brand: brand_with_logo(@brand) }, status: :created
    else
      render json: { error: @brand.errors }, status: :unprocessable_entity
    end
  end

  def update
    @brand = Brand.find(params[:id])

    authorize @brand, :update?

    if @brand.update(brand_params)
      render json: { message: 'Brand updated successfully', brand: @brand }
    else
      render json: { error: @brand.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @brand = Brand.find(params[:id])

    authorize @brand, :destroy?

    if @brand.destroy
      render json: { message: 'Brand deleted successfully', brand: @brand }
    else
      render json: { error: 'An error occurred' }, status: :unprocessable_entity
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :description, :manufacturer_id, :logo)
  end

  def brand_with_logo(brand)
    brand.as_json.merge({ logo: url_for(brand.logo) })
  end

  def brand_with_logo_and_manufacturer(brand)
    brand.as_json.merge({ logo: url_for(brand.logo), manufacturer: brand_with_logo(brand.manufacturer) })
  end

  def record_not_found
    render json: { error: 'Brand Not Found' }, status: :not_found
  end
end

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show update destroy]

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    authorize @review, :create?

    if @review.save
      render json: { message: 'Review created successfully', review: @review }, status: :created, location: @review
    else
      render json: { error: @review.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    authorize @review, :update?

    if @review.update(current_user ? review_params : review_params.except(:customer_id)
      .merge(customer_id: current_customer.id))
      render json: { message: 'Review updated successfully', review: @review }
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    authorize @review, :destroy?

    @review.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:customer_id, :rating, :title, :comment)
  end
end

class TestDrivesController < ApplicationController
  before_action :set_test_drive, only: %i[show update destroy]
  before_action :authenticate_customer!, only: %i[create]

  # GET /test_drives
  def index
    @test_drives = TestDrive.all

    authorize @test_drives, :index?

    render json: @test_drives
  end

  # GET /test_drives/1
  def show
    authorize @test_drive, :show?

    render json: @test_drive
  end

  # POST /test_drives
  def create
    @test_drive = if current_user
                    TestDrive.new(test_drive_params)
                  else
                    TestDrive.new(test_drive_params.except(:customer_id).merge(customer_id: current_customer.id))
                  end

    if @test_drive.save
      render json: { message: 'Test Drive Booked', test_drive: @test_drive }, status: :created, location: @test_drive
    else
      render json: @test_drive.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /test_drives/1
  def update
    authorize @test_drive, :update?

    if @test_drive.update(current_user ? test_drive_params : test_drive_params.except(:customer_id, :status)
      .merge(customer_id: current_customer.id, status: :pending))
      render json: { message: 'Test Drive Updated', test_drive: @test_drive }
    else
      render json: { error: @test_drive.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /test_drives/1
  def destroy
    authorize @test_drive, :destroy?

    @test_drive.destroy!
    render json: { message: 'Test Drive deleted', test_drive: @test_drive }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test_drive
    @test_drive = TestDrive.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def test_drive_params
    params.require(:test_drive).permit(:customer_id, :vehicle_id, :booking_date, :status, :notes,
                                       booking_time: %i[starting ending])
  end
end

class AcademicYearsController < ApplicationController
  before_action :set_year, only: %i[show edit update destroy]

  def index
    @years = AcademicYear.all
  end

  def show
  end



  private

  def set_year
    @year = AcademicYear.find(params[:id])
  end

  def user_params
    params.require(:academic_years).permit(:start_date, :end_date, :semester, :year, :status)
  end


end

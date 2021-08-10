class AcademicYearsController < ApplicationController
  before_action :set_year, only: %i[show edit update destroy]

  def index
    @academic_year = AcademicYear.all
  end

  def show
  end



  private

  def set_year
    @year = AcademicYear.find(params[:id])
  end

  def academic_year_params
    params.require(:academic_year).permit(:start_date, :end_date, :semester, :year, :status)
  end


end

class AcademicYearsController < ApplicationController
  before_action :set_academic_year, only: %i[show]

  
  def index
    @years = AcademicYear.all
  end

  def show;
  end



  private

  def set_academic_year
    @year = AcademicYear.find(params[:id])
  end

  def user_params
    params.require(:academic_year).permit(:start_date, :end_date, :semester, :year, :status)
  end


end

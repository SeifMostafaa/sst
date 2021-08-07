class ApplicantsController < ApplicationController
  before_action :set_applicant, only: %i[edit update]
  def index
    @applicants = Applicant.all.order(id: :asc)
  end

  def edit; end

  def update
    respond_to do |format|
      if @applicant.update(applicant_params)
        format.html { redirect_to applicants_path, notice: t(:applicant_updated) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:registered, :contacted, :school_notes)
  end

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end
end

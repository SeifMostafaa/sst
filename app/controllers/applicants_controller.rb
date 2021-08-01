class ApplicantsController < ApplicationController
  def index
    @applicants = Applicant.all.order(id: :asc)
  end
end

class Api::V1::ApplicantsController < ApplicationController
  skip_before_action :authenticate_user?
  def create
    applicant = Applicant.new(applicant_params)
    respond_to do |format|
      if applicant.save
        format.json do
          render json: { "message": 'Applicant Created Successfully!' },
                 status: 201
        end
      else
        format.json do
          render json: { "error": 'Applicant has not been created!' },
                 status: 400
        end
      end
    end
  end

  private

  def applicant_params
    params.permit(
      :address,
      :date_of_birth,
      :emergency_phone,
      :full_name,
      :gender,
      :grade,
      :notes,
      :parent_full_name,
      :parent_occupation,
      :parent_phone,
      :preparatory_school,
      :major_first_choice_id,
      :major_second_choice_id,
      :national_id
    )
  end
end

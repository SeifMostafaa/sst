class Api::V1::ApplicantsController < ApplicationController
  skip_before_action :authenticate_user?

  api :POST, 'api/v1/applicants', 'Create Applicant'
  param :recaptcha_response, Hash do
    param :success, :boolean, desc: 'whether this request was a valid reCAPTCHA token'
    param :score, :decimal, desc: 'the score for this request (0.0 - 1.0)'
    param :action, String, desc: 'the action name for this request (important to verify)'
    param :challenge_ts, DateTime, desc: "the timestamp of the challenge load (ISO format yyyy-MM-dd'T'HH:mm:ssZZ)"
    param :hostname, String, desc: 'the hostname of the site where the reCAPTCHA was solved'
    param 'error-codes', Array, of: String, desc: 'optional'
  end
  param :address, String, desc: 'Applicant Address'
  param :date_of_birth, Date, desc: 'Applicant Date of Birth'
  param :emergency_phone, String, desc: 'Applicant Emergency Phone Number'
  param :full_name, String, desc: 'Applicant Full Name'
  param :gender, %w[female male], desc: 'Applicant Gender'
  param :grade, :decimal, desc: 'Applicant Grade'
  param :notes, String, desc: 'Applicant Notes'
  param :parent_full_name, String, desc: 'Applicant Parent Full Name'
  param :parent_occupation, String, desc: 'Applicant Parent Occupation'
  param :parent_phone, String, desc: 'Applicant Parent Phone Number'
  param :preparatory_school, String, desc: 'Applicant Preparatory School'
  param :major_first_choice_id, Integer, desc: 'Applicant Major First Choice ID'
  param :major_second_choice_id, Integer, desc: 'Applicant Major Second Choice ID'
  param :national_id, Integer, desc: 'Applicant National ID'
  returns code: 400 do
    property :error, String
  end
  returns code: 201, desc: 'a successful response' do
    property :message, String
  end
  def create
    recaptcha_result = RecaptchaVerificationService.call(params[:recaptcha_response], request.remote_ip)
    respond_to do |format|
      if recaptcha_result.success?
        applicant = Applicant.new(applicant_params)
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
      else
        format.json { render json: recaptcha_result.response, status: 400 }
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

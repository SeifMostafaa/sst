class Api::V1::SubjectClassesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_user?
  def by_student
    @subject_classes = current_user.subject_classes
  end
end

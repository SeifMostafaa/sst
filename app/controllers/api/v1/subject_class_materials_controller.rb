class Api::V1::SubjectClassMaterialsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_user?

  before_action :set_subject_class, only: %i[by_subject_class]

  api :GET, 'api/v1/subject_class_materials/by_subject_class', 'Student Classes'
  param :subject_class_id, :number, desc: 'Class ID'
  returns code: 401, desc: 'Unauthorized'
  returns code: 404, desc: 'Subject Class Not Found'
  returns code: 200,
          desc: 'All Class Materials' do
    property :id, Integer, desc: "Subject Class Material's ID"
    property :name_ar, String, desc: "Subject Class Material's arabic name"
    property :name_en, String, desc: "Subject Class Material's english name"
    property :file, String, desc: "Subject Class Material's downloadable link"
  end
  def by_subject_class
    @subject_class_materials = @subject_class.subject_class_materials
  end

  private

  def set_subject_class
    @subject_class = SubjectClass.where(id: params[:subject_class_id]).first
  end
end

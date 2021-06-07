class Api::V1::SubjectClassesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_user?

  api :GET, 'api/v1/subject_classes/by_student', 'Student Classes'
  returns code: 401, desc: 'Unauthorized'
  returns code: 200,
          desc: "All Student Classes (It's named subject_class instead of class because the name class is already reserved for use within rails itself)" do
    property :id, Integer, desc: "Subject Class' ID"
    property :number, Integer, desc: "Subject Class' number"
    property :name_ar, String, desc: "Subject Class' arabic name"
    property :name_en, String, desc: "Subject Class' english name"
    property :teacher_name_ar, String, desc: "Teacher's arabic name"
    property :teacher_name_en, String, desc: "Teacher's english name"
  end
  def by_student
    @subject_classes = current_user.subject_classes
  end
end

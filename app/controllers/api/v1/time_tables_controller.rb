class Api::V1::TimeTablesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_user?

  api :GET, 'api/v1/time_tables/by_student', 'Student Time Table'
  returns code: 401, desc: 'Unauthorized'
  returns code: 200,
          desc: 'Student Time Table' do
    property :id, Integer, desc: "Time Table's' ID"
    property :period, Integer, desc: "Time Table's Period"
    property :day, %w[monday tuesday wednesday thursday friday saturday sunday],
             desc: "Time Table's Day"
    property :start_time, Time, desc: "Time Table's Start Time"
    property :start_time, Time, desc: "Time Table's End Time"
    property :subject_name_ar, String, desc: "Subject's Arabic Name"
    property :subject_name_en, String, desc: "Subject's English Name"
    property :subject_class_number, :number, desc: "Subject's Class Number"
  end
  def by_student
    @time_tables = current_user.time_tables.order(day: :asc)
  end
end

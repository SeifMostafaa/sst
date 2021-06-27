class Api::V1::AnnouncementsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_user?

  api :GET, 'api/v1/announcements/by_student', 'Student Announcements'
  returns code: 401, desc: 'Unauthorized'
  returns code: 200,
          desc: 'All Student Announcements' do
    property :id, Integer, desc: "Announcement's ID"
    property :title_ar, String, desc: "Announcement's arabic title"
    property :title_en, String, desc: "Announcement's english title"
    property :description_ar, String, desc: "Announcement's arabic description"
    property :description_en, String, desc: "Announcement's english description"
    property :announcement_type, %w[event news notice], desc: 'Announcement type'
    property :file, String, desc: "Announcement attachment's link"
  end
  def by_student
    @announcements = Announcement.where(user_type: %i[generic parents student])
  end
end

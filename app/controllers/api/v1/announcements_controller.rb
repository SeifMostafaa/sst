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
    property :attachment, String, desc: "Announcement attachment's link"
    property :attachment_type, String, desc: "Announcement attachment's type"
  end
  def by_student
    @announcements = Announcement.where(user_type: %i[generic parents student])
  end

  api :GET, 'api/v1/announcements/by_user_role', 'User Announcements'
  returns code: 401, desc: 'Unauthorized'
  returns code: 200,
          desc: 'All Announcements By User Role' do
    property :events, Hash, desc: 'Events' do
      property :id, Integer, desc: "Announcement's ID"
      property :title_ar, String, desc: "Announcement's arabic title"
      property :title_en, String, desc: "Announcement's english title"
      property :description_ar, String, desc: "Announcement's arabic description"
      property :description_en, String, desc: "Announcement's english description"
      property :announcement_type, %w[event], desc: 'Announcement type'
      property :attachment, String, desc: "Announcement attachment's link"
      property :attachment_type, String, desc: "Announcement attachment's type"
    end
    property :news, Hash, desc: 'Events' do
      property :id, Integer, desc: "Announcement's ID"
      property :title_ar, String, desc: "Announcement's arabic title"
      property :title_en, String, desc: "Announcement's english title"
      property :description_ar, String, desc: "Announcement's arabic description"
      property :description_en, String, desc: "Announcement's english description"
      property :announcement_type, %w[news], desc: 'Announcement type'
      property :attachment, String, desc: "Announcement attachment's link"
      property :attachment_type, String, desc: "Announcement attachment's type"
    end
    property :notices, Hash, desc: 'Events' do
      property :id, Integer, desc: "Announcement's ID"
      property :title_ar, String, desc: "Announcement's arabic title"
      property :title_en, String, desc: "Announcement's english title"
      property :description_ar, String, desc: "Announcement's arabic description"
      property :description_en, String, desc: "Announcement's english description"
      property :announcement_type, %w[notices], desc: 'Announcement type'
      property :attachment, String, desc: "Announcement attachment's link"
      property :attachment_type, String, desc: "Announcement attachment's type"
    end
  end
  def by_user_role
    announcements_by_user_role
  end

  api :POST, 'api/v1/announcements/create', 'Create Announcement'
  param :title_ar, String, desc: 'Arabic Title'
  param :title_en, String, desc: 'English Title'
  param :description_ar, String, desc: 'Arabic Description'
  param :description_en, String, desc: 'English Description'
  param :announcement_type, %w[event news notice], desc: 'Announcement Type'
  param :user_type, %w[generic parents specific staff student teacher], desc: 'User Type'
  param :attachment, Hash
  returns code: 400, desc: 'An unsuccessful response' do
    property :error, String, desc: 'There was an error saving the announcement. Please try again.'
  end
  returns code: 200, desc: 'A successful response' do
    property :message, String,
             desc: 'Announcement is successfully created.'
  end
  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      render(
        json: { "message": 'Announcement is successfully created.' }
      )
    else
      render(
        json: { "error": 'There was an error saving the announcement. Please try again.' },
        status: 400
      )
    end
  end

  private

  def announcement_params
    params.permit(
      :title_ar,
      :title_en,
      :description_ar,
      :description_en,
      :announcement_type,
      :user_type,
      :attachment
    )
  end

  def announcements_by_user_role
    case current_user.role
    when 'admin'
      admin_announcements
    when 'staff'
      staff_announcements
    when 'teacher'
      teacher_announcements
    else
      render(
        json: { "error": 'User Role is not found' },
        status: 404
      )
    end
  end

  def admin_announcements
    @events = Announcement.event.all
    @news = Announcement.news.all
    @notices = Announcement.notice.all
  end

  def staff_announcements
    @events = Announcement.event.where(user_type: %i[staff generic]).all
    @news = Announcement.news.staff.where(user_type: %i[staff generic]).all
    @notices = Announcement.notice.where(user_type: %i[staff generic]).all
  end

  def teacher_announcements
    @events = Announcement.event.where(user_type: %i[teacher generic]).all
    @news = Announcement.news.where(user_type: %i[teacher generic]).all
    @notices = Announcement.notice.where(user_type: %i[teacher generic]).all
  end
end

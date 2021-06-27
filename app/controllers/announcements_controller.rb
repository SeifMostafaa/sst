class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
  end

  def show; end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to announcements_path, notice: 'Announcement was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def announcement_params
    params.require(:announcement).permit(
      :title_ar,
      :title_en,
      :description_ar,
      :description_en,
      :announcement_type,
      :user_type,
      :attachment
    )
  end
end

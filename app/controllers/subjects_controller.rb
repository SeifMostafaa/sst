class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[show edit update destroy]
  before_action :set_major, only: %i[index new create edit update]
  def index
    @subjects = @major.subjects.order(semester: :asc)
  end

  def show; end

  def new
    @subject = Subject.new
  end

  def create
    @subject = @major.subjects.create(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_path(major_id: @major.id), notice: 'Subject was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subjects_path(major_id: @major.id), notice: 'Subject was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subject.destroy
    respond_to do |format|
      format.html do
        redirect_to subjects_path(major_id: @subject.major_id), notice: 'Subject was successfully destroyed.'
      end
    end
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def set_major
    @major = Major.find(params[:major_id])
  end

  def subject_params
    params.require(:subject).permit(
      :name_en,
      :name_ar,
      :description_en,
      :description_ar,
      :semester
    )
  end
end

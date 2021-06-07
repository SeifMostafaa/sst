class SubjectClassesController < ApplicationController
  before_action :set_subject_class, only: %i[show edit update destroy]
  before_action :set_subject, only: %i[index new create]

  def index
    @subject_classes = @subject.subject_classes
  end

  def new
    @subject_class = SubjectClass.new
  end

  def create
    @subject_class = @subject.subject_classes.create(subject_class_params)

    respond_to do |format|
      if @subject_class.save
        format.html do
          redirect_to subject_classes_path(subject_id: @subject.id), notice: 'Class was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @subject_class.update(subject_class_params)
        format.html do
          redirect_to subject_classes_path(subject_id: @subject_class.subject_id),
                      notice: 'Class was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subject_class.destroy
    respond_to do |format|
      format.html do
        redirect_to subject_classes_path(subject_id: @subject_class.subject_id),
                    notice: 'Class was successfully destroyed.'
      end
    end
  end

  private

  def set_subject_class
    @subject_class = SubjectClass.find(params[:id])
  end

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def subject_class_params
    params.require(:subject_class).permit(
      :academic_year_id,
      :number
    )
  end
end

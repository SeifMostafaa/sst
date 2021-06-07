class SubjectClassTeachersController < ApplicationController
  before_action :set_subject_class, only: %i[new]

  def new
    @teachers = User.teacher.all
    @subject_class_teacher = SubjectClassTeacher.new(subject_class_id: @subject_class.id)
  end

  def create
    @subject_class_teacher = SubjectClassTeacher.new(subject_class_teacher_params)

    respond_to do |format|
      if @subject_class_teacher.save
        format.html do
          redirect_to subject_classes_path(subject_id: @subject_class_teacher.subject_class.subject.id),
                      notice: 'Teacher was successfully added.'
        end
      else
        format.html do
          render new_subject_class_teacher_path(subject_class_id: @subject_class_teacher.subject_class_id),
                 status: :unprocessable_entity
        end
      end
    end
  end

  private

  def set_subject_class
    @subject_class = SubjectClass.find(params[:subject_class_id])
  end

  def subject_class_teacher_params
    params.require(:subject_class_teacher).permit(
      :user_id,
      :subject_class_id
    )
  end
end

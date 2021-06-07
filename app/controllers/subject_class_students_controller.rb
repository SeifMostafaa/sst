class SubjectClassStudentsController < ApplicationController
  before_action :set_subject_class, only: %i[index new]
  before_action :set_subject_class_student, only: %i[destroy]
  def index
    @subject_class_students = @subject_class.subject_class_students
  end

  def new
    @students = User.student.all
    @subject_class_student = SubjectClassStudent.new(subject_class_id: @subject_class.id)
  end

  def create
    @subject_class_student = SubjectClassStudent.new(subject_class_student_params)

    respond_to do |format|
      if @subject_class_student.save
        format.html do
          redirect_to subject_class_students_path(subject_class_id: @subject_class_student.subject_class_id),
                      notice: 'Teacher was successfully added.'
        end
      else
        format.html do
          render subject_class_students_path(subject_class_id: @subject_class_student.subject_class_id),
                 status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @subject_class_student.destroy
    respond_to do |format|
      format.html do
        redirect_to subject_class_students_path(subject_class_id: @subject_class_student.subject_class_id),
                    notice: 'Student was successfully destroyed.'
      end
    end
  end

  private

  def set_subject_class
    @subject_class = SubjectClass.find(params[:subject_class_id])
  end

  def set_subject_class_student
    @subject_class_student = SubjectClassStudent.find(params[:id])
  end

  def subject_class_student_params
    params.require(:subject_class_student).permit(
      :user_id,
      :subject_class_id
    )
  end
end

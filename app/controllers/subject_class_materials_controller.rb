class SubjectClassMaterialsController < ApplicationController
  before_action :set_subject_class, only: %i[index new]
  before_action :set_subject_class_material, only: %i[destroy]
  def index
    @subject_class_materials = @subject_class.subject_class_materials
  end

  def new
    @subject_class_material = SubjectClassMaterial.new(subject_class_id: @subject_class.id)
  end

  def create
    @subject_class_material = SubjectClassMaterial.new(subject_class_material_params)

    respond_to do |format|
      if @subject_class_material.save
        format.html do
          redirect_to subject_class_materials_path(subject_class_id: @subject_class_material.subject_class_id),
                      notice: 'Material was successfully added.'
        end
      else
        format.html do
          render subject_class_materials_path(subject_class_id: @subject_class_material.subject_class_id),
                 status: :unprocessable_entity
        end
      end
    end
  end

  def update; end

  def edit; end

  def destroy
    @subject_class_material.destroy
    respond_to do |format|
      format.html do
        redirect_to subject_class_materials_path(subject_class_id: @subject_class_material.subject_class_id),
                    notice: 'Material was successfully destroyed.'
      end
    end
  end

  private

  def set_subject_class
    @subject_class = SubjectClass.find(params[:subject_class_id])
  end

  def set_subject_class_material
    @subject_class_material = SubjectClassMaterial.find(params[:id])
  end

  def subject_class_material_params
    params.require(:subject_class_material).permit(
      :file,
      :name_ar,
      :name_en,
      :subject_class_id
    )
  end
end

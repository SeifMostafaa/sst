class MajorsController < ApplicationController
  before_action :set_major, only: %i[show edit update destroy]

  def index
    @majors = Major.all
  end

  def show; end

  def new
    @major = Major.new
  end

  def create
    @major = Major.new(major_params)

    respond_to do |format|
      if @major.save
        format.html { redirect_to majors_path, notice: 'Major was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @major.update(major_params)
        format.html { redirect_to majors_path, notice: 'Major was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @major.destroy
    respond_to do |format|
      format.html { redirect_to majors_path, notice: 'Major was successfully destroyed.' }
    end
  end

  private

  def set_major
    @major = Major.find(params[:id])
  end

  def major_params
    params.require(:major).permit(
      :name_en,
      :name_ar,
      :description_en,
      :description_ar
    )
  end
end

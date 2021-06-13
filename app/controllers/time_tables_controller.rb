class TimeTablesController < ApplicationController
  before_action :set_subject_class, only: %i[index new create edit update]
  def index
    @time_tables = @subject_class.time_tables
  end

  def new
    @time_table = TimeTable.new
  end

  def create
    @time_table = @subject_class.time_tables.create(time_table_params)

    respond_to do |format|
      if @time_table.save
        format.html do
          redirect_to time_tables_path(subject_class_id: @subject_class.id),
                      notice: 'Time Table was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_subject_class
    @subject_class = SubjectClass.find(params[:subject_class_id])
  end

  def time_table_params
    params.require(:time_table).permit(
      :day,
      :period,
      :start_time,
      :end_time
    )
  end
end

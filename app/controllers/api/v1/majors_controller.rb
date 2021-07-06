class Api::V1::MajorsController < ApplicationController
  skip_before_action :authenticate_user?

  api :GET, 'api/v1/majors/active', 'Get Active Majors'
  returns code: 200,
          desc: 'Active Majors' do
    property :id, Integer, desc: "Major's ID"
    property :name_ar, String, desc: "Major's Arabic Name"
    property :name_en, String, desc: "Major's English Name"
  end
  def active
    @majors = Major.where(status: :active)
  end
end

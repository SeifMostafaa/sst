json.operating_hours do
  json.start_time '07:00'
  json.end_time '15:00'
end

json.time_tables do
  json.array! @time_tables, partial: 'api/v1/time_tables/time_table',
                            as: :time_table
end

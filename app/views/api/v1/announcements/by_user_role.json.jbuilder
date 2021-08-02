json.events do
  json.array! @events, partial: 'api/v1/announcements/announcement',
                       as: :announcement
end

json.news do
  json.array! @news, partial: 'api/v1/announcements/announcement',
                     as: :announcement
end

json.notices do
  json.array! @notices, partial: 'api/v1/announcements/announcement',
                        as: :announcement
end

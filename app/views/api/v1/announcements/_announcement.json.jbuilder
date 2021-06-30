json.extract! announcement, :id, :title_ar, :title_en, :description_ar, :description_en, :announcement_type
json.attachment announcement.attachment.url
json.attachment_type announcement.attachment.content_type

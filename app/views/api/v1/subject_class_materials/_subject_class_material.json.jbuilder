json.extract! subject_class_material, :id, :name_en, :name_ar
json.file rails_blob_path(subject_class_material.file, disposition: 'attachment')

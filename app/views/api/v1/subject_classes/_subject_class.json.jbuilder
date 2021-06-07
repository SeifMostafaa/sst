json.extract! subject_class, :id, :number
json.partial! 'api/v1/subject_classes/subject', subject: subject_class&.subject
json.partial! 'api/v1/subject_classes/subject_class_teacher',
              subject_class_teacher: subject_class&.subject_class_teachers

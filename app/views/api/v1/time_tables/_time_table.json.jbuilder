json.extract! time_table, :id, :period, :day
json.start_time time_table.start_time.strftime('%H:%M')
json.end_time time_table.end_time.strftime('%H:%M')
json.subject_name_ar time_table.subject_class.subject.name_ar
json.subject_name_en time_table.subject_class.subject.name_en
json.subject_class_number time_table.subject_class.number

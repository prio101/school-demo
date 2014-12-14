json.array!(@course_sections) do |course_section|
  json.extract! course_section, :id, :school_id, :section_name, :course_id, :batch_id
  json.url course_section_url(course_section, format: :json)
end

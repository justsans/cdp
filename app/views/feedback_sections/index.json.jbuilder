json.array!(@feedback_sections) do |feedback_section|
  json.extract! feedback_section, :id, :feedback_id, :question, :answer, :rating, :question_type, :action_plan, :category
  json.url feedback_section_url(feedback_section, format: :json)
end

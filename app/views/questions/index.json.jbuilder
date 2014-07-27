json.array!(@questions) do |question|
  json.extract! question, :id, :question, :section_id, :active
  json.url question_url(question, format: :json)
end

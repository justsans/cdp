json.array!(@answers) do |answer|
  json.extract! answer, :id, :annual_summary_report_id, :question_id, :answer, :question, :section_id
  json.url answer_url(answer, format: :json)
end

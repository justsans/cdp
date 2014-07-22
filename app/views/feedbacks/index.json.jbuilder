json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :user_id, :date, :project, :from_user, :category, :message, :action_plan
  json.url feedback_url(feedback, format: :json)
end

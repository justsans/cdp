json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :user_id, :from_user_id, :from_user_name, :from_user_email, :status_id, :date, :from_user_role, :project
  json.url feedback_url(feedback, format: :json)
end

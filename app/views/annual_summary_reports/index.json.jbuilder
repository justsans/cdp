json.array!(@annual_summary_reports) do |annual_summary_report|
  json.extract! annual_summary_report, :id, :user_id, :title, :year, :status
  json.url annual_summary_report_url(annual_summary_report, format: :json)
end

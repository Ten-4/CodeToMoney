json.array!(@submissions) do |submission|
  json.extract! submission, :id, :code, :user_id, :passed, :status
  json.url submission_url(submission, format: :json)
end

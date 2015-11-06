json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :description, :prize, :user_id, :deadline, :status
  json.url task_url(task, format: :json)
end

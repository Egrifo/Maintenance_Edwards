json.extract! task, :id, :title, :minutes, :tool_id, :description, :created_at, :updated_at
json.url task_url(task, format: :json)

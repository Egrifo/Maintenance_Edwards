json.extract! task, :id, :name, :material, :description, :created_at, :updated_at
json.url task_url(task, format: :json)

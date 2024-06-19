json.extract! todo, :id, :name, :description, :deadline, :list_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)

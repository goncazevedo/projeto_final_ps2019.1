json.extract! task_cell, :id, :name, :description, :finished, :goal_cell_id, :created_at, :updated_at
json.url task_cell_url(task_cell, format: :json)

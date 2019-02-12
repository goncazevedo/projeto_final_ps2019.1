json.extract! task_board, :id, :name, :description, :finished, :goal_board_id, :created_at, :updated_at
json.url task_board_url(task_board, format: :json)

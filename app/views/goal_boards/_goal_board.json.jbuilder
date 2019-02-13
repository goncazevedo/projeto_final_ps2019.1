json.extract! goal_board, :id, :name, :deadline, :finished, :board_id, :created_at, :updated_at
json.url goal_board_url(goal_board, format: :json)

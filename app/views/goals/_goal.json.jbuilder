json.extract! goal, :id, :board_id, :cell_id, :name, :deadline, :finished, :created_at, :updated_at
json.url goal_url(goal, format: :json)

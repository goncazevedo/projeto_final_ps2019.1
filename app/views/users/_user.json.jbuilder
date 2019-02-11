json.extract! user, :id, :board_id, :cell_id, :name, :age, :cell_kind, :board_kind, :photo, :creation_cell, :created_at, :updated_at
json.url user_url(user, format: :json)

json.extract! user, :id, :name, :birth, :created_at, :updated_at
json.url user_url(user, format: :json)

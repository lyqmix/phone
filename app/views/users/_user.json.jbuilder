json.extract! user, :id, :name, :password, :intro, :email, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)

json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password_digest, :age, :address
  json.url user_url(user, format: :json)
end

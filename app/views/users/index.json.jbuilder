json.array!(@users) do |user|
  json.extract! user, :email, :password_digest
  json.url user_url(user, format: :json)
end

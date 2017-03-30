json.(@messages) do |message|
  json.id    message.id
  json.user  message.user.name
  json.body  message.body
  json.image message.image.url
  json.time  message.created_at.strftime('%F %T')
end

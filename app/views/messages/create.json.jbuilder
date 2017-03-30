json.id    @message.id
json.body  @message.body
json.image @message.image.url
json.time  @message.created_at.strftime('%F %T')

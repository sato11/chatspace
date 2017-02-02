json.set! :body, @message.body
json.set! :image, @message.image
json.set! :created_at, @message.created_at.strftime('%F %T %z')

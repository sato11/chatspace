json.set! :body, @message.body
json.set! :image, @message.image
json.set! :time, @message.created_at.strftime('%F %T')

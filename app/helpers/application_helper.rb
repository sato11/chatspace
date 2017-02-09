module ApplicationHelper
  def show_latest_content(message)
    if message.body.present?
      message.body
    elsif message.image.present?
      '画像が送信されました'
    else
      'まだメッセージはありません'
    end
  end
end

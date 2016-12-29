$(function() {
  setInterval(function() {
    window.location.reload()
  }, 10000);

  // メッセージ毎にhtmlを構築する作業を関数として定義
  // 部分テンプレート_messageの構造に沿う
  function buildHTML(message) {
    var user = $('.sidebar__top-left').html();
    var html = $('<li class="message">').append(
                  '<div class="message__user">' +
                    '<span class="message__user-name">' +
                      user +
                    '</span>' +
                    '<span class="message__posted-time">' +
                      message.created_at +
                    '</span>' +
                  '<div class="message__content">' +
                    message.body +
                  '</div>' +
                '</li>');
    return html;
  }

  // submit時にjsonで非同期通信を行う
  $('#message-form form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.footer__message');
    var message = textField.val();
    var groupId = $('form.new_message input#message_group_id').attr('value');
    $.ajax({
      type: 'POST',
      url: '/groups/' + groupId + '/messages.json',
      data: {
        message: {
          body: message
        }
      },
      datatype: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.messages').append(html);
      window.scrollTo(0, document.body.scrollHeight);
      textField.val('');
      $('input[type="submit"]').prop('disabled', false);
    })
    .fail(function() {
      alert('error');
    })
  });
});

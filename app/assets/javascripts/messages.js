$(function() {
  var messageForm = $('#new_message');

  // チャット画面において10秒おきに画面を更新する
  if ($('body').attr('controller') == 'messages') {
    setInterval(function() {
      window.location.reload()
    }, 10000);
  }

  // メッセージ毎にhtmlを構築する作業を関数として定義
  // 部分テンプレート_messageの構造に沿う
  function buildHTML(message) {
    var user = $('.sidebar__top-left').html();
    var html = $('<li class="message">').append(
                  '<div class="message__user">' +
                    '<span class="message__user-name">' +
                      user +
                    '</span>' +
                    '<span class="message__posted-time"> ' +
                      message.time +
                    '</span>' +
                  '<div class="message__content">' +
                    message.body +
                  '</div>' +
                  '<div class="message__image">' +
                    '<img src="' + message.image + '">' +
                  '</div>' +
                '</li>');
    return html;
  }

  // formDataの形式を整える
  function buildFormData(form) {
    var formData = new FormData(form.get(0));
    var message = $('.footer__message').val();
    var file = $('input[type=file]')[0].files[0];
    formData.append("body", message);
    formData.append("image", file);

    return formData;
  }

  // submit時にjsonで非同期通信を行う
  messageForm.on('submit', function(e) {
    e.preventDefault();
    var formData = buildFormData(messageForm);
    $.ajax({
      type: 'POST',
      url: './messages.json',
      data: formData,
      processData: false,
      contentType: false
    })
    .done(function(data) {
      $('.messages').append(buildHTML(data));
      $('#message_body').val('');
      window.scrollTo(0, document.body.scrollHeight);
      $('input[type="submit"]').prop('disabled', false);
    })
    .fail(function() {
      alert('error');
      $('input[type="submit"]').prop('disabled', false);
    })
  });
});

$(function() {
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

  $('#form form').on('submit', function(e) {
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
      textField.val('');
      $('input[type="submit"]').prop('disabled', false);
    })
    .fail(function() {
      alert('error');
    })
  });
});

$(function() {
  function buildHTML(message) {
    var html = $('<li class="message">').append(message.content);
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
      textField.val();
    })
    .fail(function() {
      alert('error');
    })
  });
});

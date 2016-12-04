$(function() {
  function buildHTML(message) {
    var html = $('<li class="message">').append(message.content);
    return html;
  }

  $('#form form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.footer__message');
    var message = textField.val();
    $.ajax({
      type: 'POST',
      url: '/messages.json',
      data: {
        message: {
          content: message
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

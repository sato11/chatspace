$(function() {
  $('#form form').on('submit', function(e) {
    e.preventDefault();
    message = $('.footer__message').val();
    console.log(message);
  })
})

$(function() {
  $('#search').on('click', function(e) {
    e.preventDefault();
    var textField = $('#user-search-field .chat-group-form__input');
    var input = textField.val();
    console.log(input);
    textField.val('');
  });
});

$(function() {
  $('#search').on('click', function(e) {
    e.preventDefault();
    var textField = $('#user-search-field .chat-group-form__input');
    var input = textField.val;
    $.ajax('/groups/new.json')
      .done(function(data) {
        console.log(data);
      })
      .fail(function() {
        alert('error');
      })
  });
});

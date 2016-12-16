$(function() {
  function getUser(users, input) {
    $.each(users, function(i, user) {
      var name = user.name;
      if (input == name) {
        var matchedUser = name;
        var list = $('<li>').append(matchedUser + '</li>')
        $('#user-search-result').append(list)
      }
    });
  }

  $('#search').on('click', function(e) {
    e.preventDefault();
    $('#user-search-result li').remove();
    var textField = $('#user-search-field .chat-group-form__input');
    var input = textField.val();
    $.ajax('/groups/new.json')
      .done(function(data) {
        getUser(data, input);
        textField.val('');
      })
      .fail(function() {
        alert('error');
      })
  });
});

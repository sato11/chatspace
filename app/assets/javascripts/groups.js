$(function() {
  function buildHTML(name) {
    var html = $('<li class="result-list">').append(
                    '<span class="result-list--left">' +
                      name +
                    '</span>' +
                    '<span class="result-list--right">' +
                      "追加" +
                    '</span>' +
                  '</li>');
    $('#result-field').append(html);
    return html;
  }

  function getUser(users, input) {
    $.each(users, function(i, user) {
      var name = user.name;
      if (input == name) {
        var html = buildHTML(name);
        return false;
      }
    });
  }

  $('#search').on('click', function(e) {
    e.preventDefault();
    var textField = $('#user-search-field .chat-group-form__input');
    var input = textField.val();
    $.ajax('/groups/new.json')
      .done(function(data) {
        $('#result-field li').remove();
        getUser(data, input);
        textField.val('');
      })
      .fail(function() {
        alert('error');
      })
  });
});

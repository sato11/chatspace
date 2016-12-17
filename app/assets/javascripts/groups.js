$(function() {
  function addUserHTML(name) {
    var html = $('<li class="result-list">').append(
                    '<span class="result-list--left">' +
                      name +
                    '</span>' +
                    '<span class="result-list--right">' +
                      "追加" +
                    '</span>' +
                  '</li>');
    $('#result-field').append(html);
  }

  function getUser(users, input) {
    $.each(users, function(i, user) {
      var name = user.name;
      if (input == name) {
        addUserHTML(name);
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

  function addedUserHTML(name) {
    var html = $('<li class="chat-group-user">').append(
                    '<div class="chat-group-user__name">' +
                      name +
                    '</div>' +
                    '<div class="chat-group-user__btn chat-group-user__btn--remove">' +
                      "削除" +
                    '</div>' +
                  '</li>');
    return html;
  }

  $(document).on('click', '.result-list--right', function() {
    var name = $(this).prev().html();
    var html = addedUserHTML(name);
    $('#added-users').append(html);
  });
});

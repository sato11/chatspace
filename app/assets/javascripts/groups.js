$(function() {
  function addUserHTML(user) {
    var html = $('<li class="result-list">').append(
                    '<span class="result-list--left">' +
                      user.name +
                    '</span>' +
                    '<span class="result-list--right">' +
                      "追加" +
                    '</span>' +
                    '<input value="' + user.id +  '" type="hidden">' +
                  '</li>');
    $('#result-field').append(html);
  }

  function getUser(users, input) {
    $.each(users, function(i, user) {
      var name = user.name;
      if (input == name) {
        addUserHTML(user);
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

  function addedUserHTML(name, id) {
    var html = $('<li class="chat-group-user">').append(
                    '<div class="chat-group-user__name">' +
                      name +
                    '</div>' +
                    '<div class="chat-group-user__btn chat-group-user__btn--remove">' +
                      "削除" +
                    '</div>' +
                    '<input value="' + id +  '" type="hidden">' +
                  '</li>');
    return html;
  }

  $(document).on('click', '.result-list--right', function() {
    var name = $(this).prev().html();
    var id = $(this).next().attr('value');
    var html = addedUserHTML(name, id);
    $('#added-users').append(html);
    $(this).parent().remove();
  });

  $(document).on('click', '.chat-group-user__btn--remove', function() {
    $(this).parent().remove();
  });


  $('.chat-group-form__action-btn').on('click', function(e) {
    e.preventDefault();
    var name = $('#chat_group_name input').val();
    var user_ids = []
    $('.chat-group-user input').each(function() {
      user_ids.push( $(this).attr('value') );
    });

    $.ajax({
      type: 'POST',
      url: '/groups',
      data: {
        group: {
          name: name,
          user_ids: user_ids
        }
      },
      datatype: 'html'
    })
    .done(function() {
    })
    .fail(function() {
      alert('error');
    })
  });
});
